
//`timescale 1ns / 1ps

////THIS MODULE HOLDS THE FILE AND ITS CODE, IT GIVES THE CPU COMPONENTS ITS DATA
//module instruction_memory(
    
//    input [15:0] address,        // Address of the instruction to fetch
//    output reg [15:0] instruction, // 16-bit instruction fetched from memory
//    input clk

//    );
//    // Memory array for 64 locations, each 16 bits wide
//    reg [15:0] memory [63:0];
//    reg [15:0] OutputReg;  // Internal reg to hold the output value
    
//   //addi r1 1
//   //add r2 2
//   //add r3 r2
//   //sub r3 r1
   
   
//   initial begin
//        //instructions for testing addi, add, sub, sll, and, sw, lw
//        memory[0] = 16'b0011000100100001; //addi r1, r2, 1
//        memory[2] = 16'b0011001101000010; //addi r3, r4 ,2 
//        memory[4] = 16'b0000010100010000; //add r5, r1 
//        memory[6] = 16'b0000010100010000; //add r5, r1
//        memory[8] = 16'b0000000100110001; //sub r1, r3
//        memory[10] = 16'b0000001100010010; //sll r3, r1
//        memory[12] = 16'b0000001100010011; //and r3, r1
//        //memory[14] = 16'b0011010001000101; //addi r4, r4, 5, , 
//        //memory[16] = 16'b0010010000010100; // sw r4, 4(r1)
//        //memory[18] = 16'b0001011100010100; // lw r7, 4(r1)
        
//        //instructions for testing beq
//        //memory[0] = 16'b0100011000010001; //beq r6, r1, 1 -> If (r6 ==r1), then it go to memory[4] not memory[2]
//        //memory[2] = 16'b0011011001100001; //addi r6, r6, 1
//        //memory[4] = 16'b0011011001100011; //addi r6, r6, 3
//        //memory[6] = 16'b0100011000010001; //beq r6, r1, 1
//        //memory[8] = 16'b0011000100010001; //addi r1,r1, 1
        
//        //instructions for testing bne
//        //memory[0] = 16'b0101011000010001; //bne r6, r1, 1
//        //memory[2] = 16'b0011011001100001; //addi r6, r6, 1
//        //memory[4] = 16'b0011011001100010; //addi r6, r6, 2
//        //memory[6] = 16'b0101011000010001; //bne r6, r1, 1
//        //memory[8] = 16'b0011011001100001; //addi r6, r6, 1
//        //memory[10] = 16'b0011011001100010; //addi r6, r6, 2
        
//        //instruction for testing jmp
//        //memory[0] = 16'b0110000000000001;
//        //memory[2] = 16'b0011000100010001; //addi r1, r1, 1
//        //memory[4] = 16'b0011000100010010; //addi r1, r1, 2
                
        
        
        
        
//    end
    
    
//    assign OutputData = instruction;
    
//    always @ (posedge clk) begin
    
    
//    instruction <= memory[address];
    
//    end
    
//   // Monitor important signals (optional)
//  initial begin
//    //$monitor("Time inside IJMMMMMMMMMMMMMMMMMMM: %t |Address: %h| Instruction: %b", $time, address, instruction);
//  end
    
    
    
//endmodule

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

   //addi r1 1
   //add r2 2
   //add r3 r2
   //sub r3 r1


   initial begin
        memory[0] = 16'b0011000100010001;  // addi r1 r1 1
        memory[2] = 16'b0011001000100010;  // addi r2 r2 2
       // memory[4] = 16'b0011001000100010;  // addi r2 r2 2

        memory[4] = 16'b0110111111111101;  // jump memory 0 NOT *WORKING

        //memory[4] = 16'b0010000100100000;  // Example instruction SW 
        memory[6] = 16'b0010001000010000;  // Example instruction SW 

        memory[8] = 16'b0001010000100000;  // Example instruction LW
        //memory[10] = 16'b0001001100010000;  // Example instruction LW


        //memory[6] = 16'b0000001000010000;  // Example instruction (add) r3 r2
        //memory[8] = 16'b0000001100010001;  // Example instruction (sub) r1-r3

        //memory[2] = 16'b0110000000000001;  // jmp
        // More instructions can be loaded here
    end


    assign instruction = memory[address];







   // Monitor important signals (optional)
  initial begin
    $monitor("Time inside IM: %t |Address: %h| Instruction: %b", clk, address, instruction);
  end



endmodule
    
    