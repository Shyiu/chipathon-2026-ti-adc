`timescale 1ns / 1ps

module sar_adc_logic #(
    parameter int RESOLUTION       = 8
)(
    input  logic rst_n,
    input  logic clk_i,
    input  logic out_p,
    input  logic out_n,

    output logic [RESOLUTION-1:0] dac_ctrl,
    output logic [RESOLUTION-1:0] dout,
    output logic clk_o
);

    logic rst_n_tree;
    gf180mcu_fd_sc_mcu7t5v0__buf_8 rst_root (
        .I(rst_n),
        .Z(rst_n_tree)
    );

    logic valid_clk;
    gf180mcu_fd_sc_mcu7t5v0__xor2_4 valid_clk_xor (
        .A1(out_p),
        .A2(out_n),
        .Z(valid_clk)
    );

    logic [RESOLUTION:0] seq;
    logic [RESOLUTION-1:0] sar_reg;
    logic [RESOLUTION-1:0] sar_reg_next;
    logic eoc;

    assign eoc = seq[0];

    logic start_req;
    logic seq_at_msb;
    assign seq_at_msb = seq[RESOLUTION];

    always_ff @(negedge clk_i or negedge rst_n_tree) begin
        if (!rst_n_tree) start_req <= 1'b0;
        else if (seq_at_msb) start_req <= 1'b0;
        else start_req <= 1'b1;
    end

    logic seq_rst;
    assign seq_rst = ~rst_n_tree | start_req;

    always_comb begin
        sar_reg_next = sar_reg;
        for (int i = 0; i < RESOLUTION; i++) begin
            if (seq[i+1]) sar_reg_next[i] = out_p ? 1'b1 : 1'b0;
        end
        for (int i = 0; i < RESOLUTION-1; i++) begin
            if (seq[i+2]) sar_reg_next[i] = 1'b1;
        end
    end

    always_ff @(posedge valid_clk or posedge seq_rst) begin
        if (seq_rst) begin

            seq     <= {1'b1, {RESOLUTION{1'b0}}};
            sar_reg <= {1'b1, {(RESOLUTION-1){1'b0}}};
        end else begin
            seq     <= seq >> 1;
            sar_reg <= sar_reg_next;
        end
    end

    always_ff @(posedge eoc or negedge rst_n_tree) begin
        if (!rst_n_tree) dout <= '0;
        else dout <= sar_reg;
    end

    logic comp_trigger_raw;
    gf180mcu_fd_sc_mcu7t5v0__nor3_4 comp_trigger_nor (
        .A1(valid_clk), .A2(eoc), .A3(start_req), .ZN(comp_trigger_raw)
    );

    logic comp_trigger;

    (* keep = "true" *) logic [260:0] dly_chain;
    assign dly_chain[0] = comp_trigger_raw;

    generate
        for (genvar g = 0; g < 260; g++) begin : dly_stage
            gf180mcu_fd_sc_mcu7t5v0__buf_1 delay_buf (
                .I(dly_chain[g]),
                .Z(dly_chain[g+1])
            );
        end

        gf180mcu_fd_sc_mcu7t5v0__buf_16 comp_trigger_driver (
            .I(dly_chain[260]),
            .Z(comp_trigger)
        );
    endgenerate

    assign clk_o    = comp_trigger;
    assign dac_ctrl = sar_reg;

endmodule