`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 12:05:21 PM
// Design Name: 
// Module Name: Branch_Predictor
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


module Branch_Predictor(
        input clk,
        input reset,
        input branch_taken,
        
        output reg branch_pred
    );
    
    reg [1:0] prev_state;
    reg [1:0] current_state;
    
    always @(posedge clk)
    begin
        case(prev_state)
            2'b00 : current_state = (branch_taken==1)? 2'b01:2'b00;
            2'b01 : current_state = (branch_taken==1)? 2'b10:2'b00;
            2'b10 : current_state = (branch_taken==1)? 2'b11:2'b01;
            2'b11 : current_state = (branch_taken==1)? 2'b11:2'b10;
        endcase
    end
    
    assign branch_pred = ((current_state == 2'b00)|(current_state == 2'b01))? 1'b0 : 1'b1;
                
endmodule
