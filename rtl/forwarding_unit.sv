`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 02:57:01 PM
// Design Name: 
// Module Name: forwarding_unit
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


module forwarding_unit(
    input logic [4:0]ex_r1_addr,ex_r2_addr,mem_rd_addr,pc_rd_addr,
    input logic mem_wrt_en,pc_wrt_en,
    output logic [1:0]mux_r1_select,mux_r2_select
    );
    
always_comb begin
if((ex_r1_addr==mem_rd_addr) & (mem_rd_addr!=0) & (mem_wrt_en==1))begin
    mux_r1_select=2'b01;
end 
else if((ex_r1_addr==pc_rd_addr) & (pc_rd_addr!=0) & (pc_wrt_en==1)) begin
    mux_r1_select=2'b10;
end 
else begin
    mux_r1_select=2'b00;
end

if((ex_r2_addr==mem_rd_addr) & (mem_rd_addr!=0) & (mem_wrt_en==1))begin
    mux_r2_select=2'b01;
end 
else if((ex_r2_addr==pc_rd_addr) & (pc_rd_addr!=0) & (pc_wrt_en==1)) begin
    mux_r2_select=2'b10;
end 
else begin
    mux_r2_select=2'b00;
end

end 
  
endmodule
