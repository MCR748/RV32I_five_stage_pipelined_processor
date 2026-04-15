`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 10:57:47 AM
// Design Name: 
// Module Name: Instruction_mem
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

module Instruction_mem#(parameter inst_width=32,inst_space=5)(
input logic [inst_width-1:0]pc,
output logic [inst_width-1:0]instruction
  );
    
    logic [inst_width-1:0] Inst_mem [2**(inst_space)-1:0];

    assign Inst_mem[0]   = 32'h00007033;//      and  r0,r0,r0           ALUResult = h0 = r0          
    assign Inst_mem[1]   = 32'h00100093;//      addi r1,r0, 1           ALUResult = h1 = 
    assign Inst_mem[2]   = 32'b000000001001_00000_000_00010_0010011;
    //assign Inst_mem[3]   = 32'b000000001010_00000_000_00110_0010011;
    //assign Inst_mem[4]   = 32'b000000001010_00000_000_00111_0010011;
    assign Inst_mem[3]   = 32'b0000000_00001_00000_010_00100_0100011;
    assign Inst_mem[4]   = 32'b000000000100_00000_010_00010_0000011;  
    //assign Inst_mem[5]   = 32'b0000000_00001_00010_000_00011_0110011;
    
    
    logic [inst_width-1:0] Inst_cache [8-1:0];
    //Tag_bits Set_Row
    logic [2:0] Tag_bits_0_0;
    logic [2:0] Tag_bits_0_1;
    logic [2:0] Tag_bits_1_0;
    logic [2:0] Tag_bits_1_1;
    //To indicate the line with last values entered
    //FIFO
    logic Flag_bits_0 = 1'b0;                                //Setting flag bits to set 0
    logic Flag_bits_1 = 1'b0;                                //Setting flag bits to set 1
    
    logic [inst_width-1:0] pc_next;
    always_comb begin 
      pc_next = {pc[31:2],2'b0} + 32'd4;
    end
    //assign pc_next = pc + 32'd4;

    //Reading from cache
    always_comb begin 
      if (pc[3]) begin
        //Check in Set1
        if (Tag_bits_1_1 == pc[6:4]) begin
          //The required inst is in row1
          instruction = (pc[2]) ? Inst_cache[7] : Inst_cache[6];    
        end else if (Tag_bits_1_0 == pc[6:4]) begin
          //The required inst is in row0
          instruction = (pc[2]) ? Inst_cache[5] : Inst_cache[4];  
        end else begin
          //Cache miss
          instruction = Inst_mem[pc[31:2]];

          //Adding the row to the cache
          if (Flag_bits_1) begin
              Inst_cache[6] = Inst_mem[pc[31:2]];
              Inst_cache[7] = Inst_mem[pc_next[31:2]];
              Tag_bits_1_1 = pc[6:4];
          end else begin
              Inst_cache[4] = Inst_mem[pc[31:2]];
              Inst_cache[5] = Inst_mem[pc_next[31:2]]; 
              Tag_bits_1_0 = pc[6:4];         
          end
          Flag_bits_1 = !Flag_bits_1;

        end
        
      end else begin
        //Check in Set0
        if (Tag_bits_0_1 == pc[6:4]) begin
          //The required inst is in row1
          instruction = (pc[2]) ? Inst_cache[3] : Inst_cache[2];    
        end else if (Tag_bits_0_0 == pc[6:4]) begin
          //The required inst is in row0
          instruction = (pc[2]) ? Inst_cache[1] : Inst_cache[0];  
        end else begin
          //Cache miss
          instruction = Inst_mem[pc[31:2]];

          //Adding to the cache
          if (Flag_bits_0) begin
              Inst_cache[2] = Inst_mem[pc[31:2]];
              Inst_cache[3] = Inst_mem[pc_next[31:2]];
              Tag_bits_0_1 = pc[6:4];
          end else begin
              Inst_cache[0] = Inst_mem[pc[31:2]];
              Inst_cache[1] = Inst_mem[pc_next[31:2]]; 
              Tag_bits_0_0 = pc[6:4];         
          end
          Flag_bits_0 = !Flag_bits_0;
        end
      end
      
    end 
    //assign    instruction = Inst_mem[pc[31:2]];
 

endmodule
