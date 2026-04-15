`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 05:01:32 PM
// Design Name: 
// Module Name: Mux_3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux_3#(parameter width=32)(
   input logic signed [width-1:0]ex_reg,mem_ALU_out,pc_ALU_out,
   input logic signed [1:0]signal,
   output logic signed [width-1:0]reg_val
    );
    
always_comb begin
    case(signal) 
        2'b00: reg_val<=ex_reg;
        2'b01: reg_val<=mem_ALU_out;
        2'b10: reg_val<=pc_ALU_out; 
        default : reg_val<=ex_reg;
    endcase
end

endmodule
