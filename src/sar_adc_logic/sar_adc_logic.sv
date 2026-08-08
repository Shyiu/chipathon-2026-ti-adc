`timescale 1ns / 1ps

module sar_adc_logic #(
    parameter int RESOLUTION      = 8,     // number of SAR bits
    parameter int NUM_DELAY_CELLS = 260    // buffer stages in the comparator-strobe delay chain
)(
    input  logic rst_n,
    input  logic clk_i,              // 25MHz phi: high = convert, low = track

    input  logic out_p,              // comparator: guess too high
    input  logic out_n,              // comparator: guess too low

    output logic phi_top,            // top-plate switch enable (opens first)
    output logic phi_top_n,
    output logic phi_bottom,         // bottom-plate TG enable (opens second)
    output logic phi_bottom_n,

    output logic [RESOLUTION-1:0] d_ctrl,    // live trial code driving the CDAC
    output logic [RESOLUTION-1:0] d_ctrl_n,  // complementary code (TG/PMOS legs)
    output logic [RESOLUTION-1:0] d_out,     // latched result, valid after EOC

    output logic clk_o               // strobes the external comparator
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
    assign phi_top   = phi_top_int;
    assign phi_top_n = ~phi_top_int;

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
    // Comparator decision detect
    // ------------------------------------------------------------
    logic valid_clk;
    gf180mcu_fd_sc_mcu7t5v0__xor2_4 valid_clk_xor (
        .A1(out_p),
        .A2(out_n),
        .Z(valid_clk)
    );

    // DELAYED CLOCK FIX: Wait for SAR combinational logic to settle 
    // before clocking the SAR register to prevent Setup/Hold violations
    logic seq_clk;
    gf180mcu_fd_sc_mcu7t5v0__dlyd_1 clock_delay_buffer (
        .I(valid_clk),
        .Z(seq_clk)
    );

    // ------------------------------------------------------------
    // Bit sequencer (N+1 One-Hot Mask)
    // ------------------------------------------------------------
    logic rst_cond;
    assign rst_cond = ~rst_n | phi_bottom;

    // Use a 9-bit mask for 8-bit resolution. 
    // The '1' drops into mask[0] to synchronously trigger EOC.
    logic [RESOLUTION:0]    mask;
    logic [RESOLUTION-1:0]  sar_reg;
    logic                   eoc;

    assign eoc = mask[0];

    // UPDATED: Now driven by the delayed clock (seq_clk) instead of valid_clk
    always_ff @(posedge seq_clk or posedge rst_cond) begin
        if (rst_cond) begin
            mask    <= {1'b1, {RESOLUTION{1'b0}}};     // e.g. 9'b1_0000_0000
            sar_reg <= {1'b1, {(RESOLUTION-1){1'b0}}}; // e.g. 8'b1000_0000
        end else begin
            mask <= mask >> 1;
            // Use mask[RESOLUTION:1] as the active 8-bit trial vector
            sar_reg <= (out_p ? (sar_reg & ~mask[RESOLUTION:1]) : sar_reg) | (mask[RESOLUTION:1] >> 1);
        end
    end

    // d_out perfectly latches the moment mask[0] becomes 1
    always_ff @(posedge eoc or negedge rst_n) begin
        if (!rst_n) d_out <= '0;
        else             d_out <= sar_reg;
    end

    assign d_ctrl   = sar_reg;
    assign d_ctrl_n = ~sar_reg;

    // ------------------------------------------------------------
    // Async clk_o ring
    // ------------------------------------------------------------
    logic phi_bottom_neg;
    assign phi_bottom_n = phi_bottom_neg;
    gf180mcu_fd_sc_mcu7t5v0__inv_1 phi_bottom_inv (
        .I(phi_bottom),
        .ZN(phi_bottom_neg)
    );

    logic comp_trigger_raw;
    // NOTE: Keep valid_clk here (not seq_clk) to avoid adding unwanted 
    // delay to the strobe generator ring oscillator
    gf180mcu_fd_sc_mcu7t5v0__nor3_4 comp_trigger_nor (
        .A1(valid_clk),
        .A2(eoc),
        .A3(phi_bottom),
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