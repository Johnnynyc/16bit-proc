
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
   //WORKING TESTCASE 1 ADD 1 repeatedly WORKING
        //memory[0] = 16'b0011000100010000;  // addi r1 0 SKIPPING ONE FOR RESET (BUG)
        //memory[0] = 16'b0011000100010001;  // addi r1 r1 1
        //memory[2] = 16'b0110111111111110;  // jump memory 0 
        //memory[4] = 16'b0010001000010000;  // Example instruction SW 
        //memory[6] = 16'b0001010000100000;  // Example instruction LW
   //TESTCASE 1 END 
   
   //TESTCASE 2 START STORE INTO MEMORY AND LOAD FROM MEMORY  WORKING
//        memory[0] = 16'b0011000100010001;  // addi r1 r1 
//        memory[2] = 16'b0011001000100010;  // addi r2 r2 2
//        memory[4] = 16'b0010001000010000;  // Example instruction SW r2, r1[0]
//        memory[6] = 16'b0001000100010000;  // Example instruction LW
   //TESTCASE 2 END
   
   //TESTCASE 3 START SLL by 1 each on loop
      // memory[0] = 16'b0011000100010000;  // addi r1 0 

        memory[0] = 16'b0011000100010001;  // addi r1 r1 1
        memory[2] = 16'b0011001000100001;  // addi r2 r2 1
        memory[4] = 16'b0000000100100010;  //sll r1 r2(1 is in s2)
        memory[6] = 16'b0110111111111110;  // jump memory 2 
        memory[8] = 16'b0010000100100000;  // Example instruction SW 
    //TESTCASE 3 WORKING
    
    //TESTCASE 4 WORKING SUBTRACTION WORKING and AND 
//    memory[0] = 16'b0011000100010001;  // addi r1 r1  
//    memory[2] = 16'b0011001000100100;  // addi r2 r2 4
//    memory[4] = 16'b0000000100100001;   //sub r2 - r1
//    memory[6] = 16'b0000000100100000;   //add r2 + r1
    //TESTCASE 4 
    
    //TESTCASE 5 ANDING higher bits WORKING
      
    
//    memory[2] = 16'b0011000100011111;  // addi r1 15 
    
//    memory[4] = 16'b0011001100110111;  // addi r3 7
//    memory[6] = 16'b0011010001000111;  // addi r4 r4 7
//    memory[8] = 16'b0000001101000010;  //sll r3 r4(1 is in s2)
//    memory[10] = 16'b0000000100110011;  //and r1 r3
    //TESTCASE 5 
    
    
    //TESTCASE 6 BRANCH WORKING
//    memory[2] = 16'b0011001000100100;  // addi r2 r2 4
//    memory[4] = 16'b0011000100010001;  // addi r1 r1 1
//    memory[6] = 16'b0101000100101110;  // BNE cmp r1 r2
//    memory[8] = 16'b0011010001001111;  // addi r1 15 TO SHOW BRANCH WAS NOT TAKEN
    //TESTCASE ^ END 

    
    
    
        
        
        
        //memory[10] = 16'b0001001100010000;  // Example instruction LW
        
        
        //memory[6] = 16'b0000001000010000;  // Example instruction (add) r3 r2
        //memory[8] = 16'b0000001100010001;  // Example instruction (sub) r1-r3
        
        //memory[2] = 16'b0110000000000001;  // jmp
        // More instructions can be loaded here
    end
    
    
    assign  instruction = memory[address];
    
    
    
   // Monitor important signals (optional)
  initial begin
    //$monitor("Time inside IJMMMMMMMMMMMMMMMMMMM: %t |Address: %h| Instruction: %b", $time, address, instruction);
  end
    
    
    
endmodule

    
    