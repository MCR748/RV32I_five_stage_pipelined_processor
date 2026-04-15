`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 12:04:26 PM
// Design Name: 
// Module Name: BTB
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


module BTB #(parameter pc_len = 8, cache_len=16) //, cache_size = 32
    (
        input clk,
        input reset,
        input pc,
        
        output reg BTA,
        output reg hit
    );
    
//    reg [2*pc_len-1:0] cache [cache_size-1:0];
    
    reg [cache_len-1:0] cache0, cache1, cache2;
	
	assign hit =((cache0[7:0] == pc)|(cache1[7:0] == pc)|(cache2[7:0] == pc));
	
	initial 
        begin
			cache0 = 16'h0;
			cache1 = 16'h0;
			cache2 = 16'h0;
        end
	
	always @(posedge clk)
	begin
	   if (reset == 1)
			begin
				cache0 <= 16'h000000FFFF;
				cache1 <= 16'h000000FFFF;
				cache2 <= 16'h000000FFFF;
			end
		else
            if (cache0[7:0] == pc) BTA = cache0[15:8];
            else if (cache1[7:0] == pc) BTA = cache1[15:8];
            else if (cache2[7:0] == pc) BTA = cache2[15:8];
            else BTA = 0;
	end  
endmodule
