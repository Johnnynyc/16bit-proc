`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 05:59:32 PM
// Design Name: 
// Module Name: control_unit_test
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


module control_unit_test;
    reg [3:0] opcode;
    reg [3:0] function_code;
    wire RegDst;
    wire RegWrite;
    wire Branch;
    wire Jump;
    wire [3:0]ALUop;
    wire MemRead;
    wire MemWrite;
    wire RegWriteSource;
    wire ALUSource;
    
    control_unit uut (
        .opcode(opcode),
        .function_code(function_code),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .Branch(Branch),
        .Jump(Jump),
        .ALUop(ALUop),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .RegWriteSource(RegWriteSource),
        .ALUSource(ALUSource)
    );
    
    initial begin
        opcode = 4'b0000;
        function_code = 4'b0000;  
        #10;
        $display("add => RegDst=%b, RegWrite=%b, ALUop=%b", RegDst, RegWrite, ALUop);
        
        opcode = 4'b0000;
        function_code = 4'b0001;  
        #10;
        $display("sub => RegDst=%b, RegWrite=%b, ALUop=%b", RegDst, RegWrite, ALUop);
        
        opcode = 4'b0000;
        function_code = 4'b0010;  
        #10;
        $display("sll => RegDst=%b, RegWrite=%b, ALUop=%b", RegDst, RegWrite, ALUop);
        
        opcode = 4'b0000;
        function_code = 4'b0011;  
        #10;
        $display("and => RegDst=%b, RegWrite=%b, ALUop=%b", RegDst, RegWrite, ALUop);
        
        opcode = 4'b0001;
        function_code = 4'bxxxx; 
        #10;
        $display("lw => RegWrite=%b, RegWriteSource=%b, ALUSource=%b, MemRead=%b, ALUop=%b", RegWrite, RegWriteSource, ALUSource, MemRead, ALUop);
        
        opcode = 4'b0010;
        #10;
        $display("sw => ALUSource=%b, MemWrite=%b,ALUop=%b", ALUSource, MemWrite, ALUop);
        
        opcode = 4'b0011;
        #10;
        $display("addi => RegWrite=%b, ALUSource=%b, ALUop=%b", RegWrite, ALUSource, ALUop);
        
        opcode = 4'b0100;
        #10;
        $display("beq => Branch=%b, ALUop=%b", Branch, ALUop);
        
        opcode = 4'b0101;
        #10;
        $display("bne => Branch=%b, ALUop=%b", Branch, ALUop);
        
        opcode = 4'b0110;
        #100;
        $display("jmp => Jump=%b", Jump);
        
        $finish;
    end
endmodule
