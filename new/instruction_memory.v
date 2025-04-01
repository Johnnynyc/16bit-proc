
`timescale 1ns / 1ps

//THIS MODULE HOLDS THE FILE AND ITS CODE, IT GIVES THE CPU COMPONENTS ITS DATA
module instruction_memory(
    
    input [15:0] address,        // Address of the instruction to fetch
    output reg [15:0] instruction, // 16-bit instruction fetched from memory
    input clk

    );
    // Memory array for 64 locations, each 16 bits wide
    reg [15:0] memory [63:0];
    reg [15:0] OutputReg;  // Internal reg to hold the output value
    
   //addi r1 1
   //add r2 2
   //add r3 r2
   //sub r3 r1
   
   
   initial begin
        memory[0] = 16'b0011000100010001;  // addi r1 r1 1
        memory[2] = 16'b0011001000100010;  // addi r2 r2 2
       // memory[4] = 16'b0011001000100010;  // addi r2 r2 2
        
        memory[4] = 16'b0110111111111100;  // jump memory 0 *WORKING

        //memory[4] = 16'b0010000100100000;  // Example instruction SW 
        memory[6] = 16'b0010001000010000;  // Example instruction SW 
        
        memory[8] = 16'b0001010000100000;  // Example instruction LW
        //memory[10] = 16'b0001001100010000;  // Example instruction LW
        
        
        //memory[6] = 16'b0000001000010000;  // Example instruction (add) r3 r2
        //memory[8] = 16'b0000001100010001;  // Example instruction (sub) r1-r3
        
        //memory[2] = 16'b0110000000000001;  // jmp
        // More instructions can be loaded here
    end
    
    
    assign OutputData = instruction;
    
    always @ (posedge clk) begin
    
    
    instruction <= memory[address];
    
    end
    
   // Monitor important signals (optional)
  initial begin
    $monitor("Time inside IJMMMMMMMMMMMMMMMMMMM: %t |Address: %h| Instruction: %b", $time, address, instruction);
  end
    
    
    
endmodule

    
    