`timescale 1ns / 1ps

module sar_adc_logic #(
    parameter int RESOLUTION      = 8,   // number of SAR bits
    parameter int NUM_DELAY_CELLS = 260    // buffer stages in the comparator-strobe delay chain
)(
    input  logic rst_n,
    input  logic clk_i,              // 25MHz phi: high = convert, low = track

    input  logic out_p,              // comparator: guess too high
    input  logic out_n,              // comparator: guess too low

    output logic phi_top,            // top-plate switch enable (opens first)
    output logic phi_bottom,         // bottom-plate TG enable (opens second)

    output logic [RESOLUTION-1:0] d_ctrl,    // live trial code driving the CDAC
    output logic [RESOLUTION-1:0] d_ctrl_n,  // complementary code (TG/PMOS legs)
    output logic [RESOLUTION-1:0] d_out,     // latched result, valid after EOC

    output logic clk_o               // strobes the external comparator
);

    localparam int CTR_W = $clog2(RESOLUTION);

    // ------------------------------------------------------------
    // Reset tree
    // ------------------------------------------------------------
    logic rst_n_tree;
    gf180mcu_fd_sc_mcu7t5v0__buf_8 rst_root (
        .I(rst_n),
        .Z(rst_n_tree)
    );

    // ------------------------------------------------------------
    // Non-overlap generator.
    // phi_top = ~clk_i, driven straight off phi with no added delay.
    // phi_bottom = phi_top OR delayed(phi_top): the OR term means
    // phi_bottom rises the instant phi_top rises (no skew needed
    // when re-entering track), but can only fall once BOTH the
    // direct and delayed copies of phi_top have fallen -- i.e. its
    // fall lags phi_top's fall by the dead_time chain's delay.
    // This is the asymmetric skew: fast to close, delayed to open.
    // ------------------------------------------------------------
    logic phi_top_int;
    gf180mcu_fd_sc_mcu7t5v0__inv_4 phi_top_inv (
        .I(clk_i),
        .ZN(phi_top_int)
    );
    assign phi_top = phi_top_int;

    logic [2:0] dead_time_dly;
    assign dead_time_dly[0] = phi_top_int;
    generate
        for (genvar d = 0; d < 2; d++) begin : dead_time_stage
            gf180mcu_fd_sc_mcu7t5v0__inv_1 dead_time_buf (
                .I(dead_time_dly[d]),
                .ZN(dead_time_dly[d+1])
            );
        end
    endgenerate

    gf180mcu_fd_sc_mcu7t5v0__or2_4 phi_bottom_or (
        .A1(phi_top_int),
        .A2(dead_time_dly[2]),
        .Z(phi_bottom)
    );

    // ------------------------------------------------------------
    // Comparator decision detect: valid_clk goes high once the
    // comparator has resolved (exactly one of out_p/out_n is set).
    // ------------------------------------------------------------
    logic valid_clk;
    gf180mcu_fd_sc_mcu7t5v0__xor2_4 valid_clk_xor (
        .A1(out_p),
        .A2(out_n),
        .Z(valid_clk)
    );

    // ------------------------------------------------------------
    // Bit sequencer.
    // rst_cond is high any time the array is still tracking
    // (phi_bottom low) or global reset is asserted. While rst_cond
    // is high, sar_reg is continuously held at the initial trial
    // word (MSB=1, rest=0) -- so the moment phi_bottom rises, that
    // word is already sitting there, no extra delay stage required.
    // ------------------------------------------------------------
    logic rst_cond;
    assign rst_cond = ~rst_n_tree | ~phi_bottom;

    logic [CTR_W-1:0]       bit_idx;
    logic [RESOLUTION-1:0]  sar_reg;
    logic                   last_bit;
    logic                   eoc;
    logic                   done;

    assign last_bit = (bit_idx == '0);
    assign eoc      = last_bit & valid_clk;

    always_ff @(posedge valid_clk or posedge rst_cond) begin
        if (rst_cond) begin
            bit_idx <= RESOLUTION - 1;
            sar_reg <= {1'b1, {(RESOLUTION-1){1'b0}}};
        end else begin
            if (out_p) sar_reg[bit_idx] <= 1'b0;   // guess too high, clear this bit
            if (!last_bit) begin
                bit_idx            <= bit_idx - 1'b1;
                sar_reg[bit_idx-1] <= 1'b1;         // set next bit's trial
            end
        end
    end

    // Sticky done flag: once EOC latches, the ring stays gated off
    // until the next conversion cycle, instead of re-triggering on
    // every subsequent valid_clk toggle of an already-decided LSB.
    always_ff @(posedge eoc or posedge rst_cond) begin
        if (rst_cond) done <= 1'b0;
        else          done <= 1'b1;
    end

    always_ff @(posedge eoc or negedge rst_n_tree) begin
        if (!rst_n_tree) d_out <= '0;
        else             d_out <= sar_reg;
    end

    assign d_ctrl   = sar_reg;
    assign d_ctrl_n = ~sar_reg;

    // ------------------------------------------------------------
    // Async clk_o ring. comp_trigger_raw is high whenever the
    // comparator hasn't resolved yet, the sequence isn't done, and
    // the array is actually isolated (phi_bottom high). It ripples
    // through NUM_DELAY_CELLS of buffer delay -- sized so total
    // delay exceeds worst-case CDAC settling time -- before
    // strobing the comparator as clk_o.
    // ------------------------------------------------------------
    logic phi_bottom_n;
    gf180mcu_fd_sc_mcu7t5v0__inv_1 phi_bottom_inv (
        .I(phi_bottom),
        .ZN(phi_bottom_n)
    );

    logic comp_trigger_raw;
    gf180mcu_fd_sc_mcu7t5v0__nor3_4 comp_trigger_nor (
        .A1(valid_clk),
        .A2(done),
        .A3(phi_bottom_n),
        .ZN(comp_trigger_raw)
    );

    logic [NUM_DELAY_CELLS:0] dly_chain;
    assign dly_chain[0] = comp_trigger_raw;
    generate
        for (genvar g = 0; g < NUM_DELAY_CELLS; g++) begin : dly_stage
            gf180mcu_fd_sc_mcu7t5v0__buf_1 delay_buf (
                .I(dly_chain[g]),
                .Z(dly_chain[g+1])
            );
        end
    endgenerate

    gf180mcu_fd_sc_mcu7t5v0__buf_16 comp_trigger_driver (
        .I(dly_chain[NUM_DELAY_CELLS]),
        .Z(clk_o)
    );

endmodule