`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 02:05:25 PM
// Design Name: 
// Module Name: branch_logic
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


module branch_logic(
        input branch_pred,
        input hit,
        
        output sel
    );
    
    assign sel = (branch_pred && sel)? 1'b1: 1'b0;
endmodule
