`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 08:32:12 PM
// Design Name: 
// Module Name: pipe_flush
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


module pipe_flush(
    input logic branch,
    output logic flush
    );
    
always_comb begin
    if(branch==1)begin
        flush=1'b1;
    end
    else begin
        flush=1'b0;
    end
end


endmodule
