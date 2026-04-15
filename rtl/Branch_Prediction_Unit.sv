`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 09:36:42 PM
// Design Name: 
// Module Name: Branch_Prediction_Unit
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


module Branch_Prediction_Unit(
        input clk,
        input reset,
        input pc,
        input branch_taken,
        
        output reg BTA,
        output reg sel
    );
    
    reg hit;
    reg branch_pred;
    
    BTB BTB_dut(.clk(clk), .reset(reset), .pc(pc), .BTA(BTA), .hit(hit));
    Branch_Predictor Branch_Predictor_dut(.clk(clk), .reset(reset), .branch_taken(branch_taken), .branch_pred(branch_pred));
    branch_logic branch_logic_dut(.branch_pred(branch_pred), .hit(hit), .sel(sel));
    
endmodule
