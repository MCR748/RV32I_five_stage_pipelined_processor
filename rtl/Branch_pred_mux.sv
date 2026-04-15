`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 01:59:14 PM
// Design Name: 
// Module Name: Branch_pred_mux
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


module Branch_pred_mux(
        input sel,
        input pc,
        input BTA,
        
        output next_pc
    );
    
    assign next_pc = (sel)? BTA: pc;
endmodule
