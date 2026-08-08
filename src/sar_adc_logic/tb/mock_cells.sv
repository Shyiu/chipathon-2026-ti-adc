`timescale 1ns / 1ps

// Basic gates
module gf180mcu_fd_sc_mcu7t5v0__buf_8 (input I, output Z); assign Z = I; endmodule
module gf180mcu_fd_sc_mcu7t5v0__buf_16 (input I, output Z); assign Z = I; endmodule
module gf180mcu_fd_sc_mcu7t5v0__inv_4 (input I, output ZN); assign ZN = ~I; endmodule
module gf180mcu_fd_sc_mcu7t5v0__inv_1 (input I, output ZN); assign ZN = ~I; endmodule
module gf180mcu_fd_sc_mcu7t5v0__or2_4 (input A1, input A2, output Z); assign Z = A1 | A2; endmodule
module gf180mcu_fd_sc_mcu7t5v0__xor2_4 (input A1, input A2, output Z); assign Z = A1 ^ A2; endmodule
module gf180mcu_fd_sc_mcu7t5v0__nor3_4 (input A1, input A2, input A3, output ZN); assign ZN = ~(A1 | A2 | A3); endmodule

// The delay chain cell - assigned a 1ns delay so the async loop functions correctly in sim
module gf180mcu_fd_sc_mcu7t5v0__buf_1 (input I, output Z); 
    assign #1 Z = I; 
endmodule