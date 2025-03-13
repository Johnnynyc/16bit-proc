`timescale 1ns / 1ps

//THIS MODULE HOLDS THE FILE AND ITS CODE, IT GIVES THE CPU COMPONENTS ITS DATA
module instruction_memory(
    
    input [15:0] address,        // Address of the instruction to fetch
    output wire [15:0] instruction, // 16-bit instruction fetched from memory
    input clk

    );
    // Memory array for 64 locations, each 16 bits wide
    reg [15:0] memory [63:0];
    reg [15:0] OutputReg;  // Internal reg to hold the output value
    reg [3:0] opcode;
    integer i = 1;
   
    
    assign OutputData = instruction;
    
    always @ (posedge clk) begin
    if (i == 1) begin
        $readmemb("./memfile.txt",memory,0,4);
        i = 0;
    end
    
    OutputReg <= memory[address];
    
    end
    
    
endmodule

    