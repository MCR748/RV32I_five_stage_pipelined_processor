`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2023 05:15:15 PM
// Design Name: 
// Module Name: wrapper
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


module wrapper(
    input wire clk,rst,
    input wire sw_0, sw_1, sw_2,sw_3,
    output wire FPGA_out_0, FPGA_out_1, FPGA_out_2, FPGA_out_3 
    );
    reg [1:0] switches;
    always@(*) begin 
        case({sw_3, sw_2, sw_1,sw_0})
        4'b0001 : switches = 2'b00;
        4'b0010 : switches = 2'b01;
        4'b0100 : switches = 2'b00;
        4'b1000 : switches = 2'b00;
        default: switches = 2'bxx;
        endcase 
    end
    wire [3:0] FPGA_out;
    
    assign FPGA_out_0 = FPGA_out[0];
    assign FPGA_out_1 = FPGA_out[1];
    assign FPGA_out_2 = FPGA_out[2];
    assign FPGA_out_3 = FPGA_out[3]; 
    
    datapath datapath_blk(
    .clk(clk),
    .rst(rst),
    .sw(switches),
    .FPGA_out(FPGA_out));
    
endmodule
