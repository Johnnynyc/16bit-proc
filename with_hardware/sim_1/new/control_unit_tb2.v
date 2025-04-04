`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 07:02:46 PM
// Design Name: 
// Module Name: control_unit_tb2
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


module control_unit_tb2;
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
        
        
        opcode = 4'b0001;
        function_code = 4'bxxxx; 
        #10;
        $display("lw => RegDst=%b, RegWrite=%b, Branch=%b, Jump=%b, ALUop=%b, MemRead=%b, MemWrite=%b, RegWriteSource=%b, ALUSource=%b",
                 RegDst, RegWrite, Branch, Jump, ALUop, MemRead, MemWrite, RegWriteSource, ALUSource);
        
        opcode = 4'b0010;
        #10;
        $display("sw => RegDst=%b, RegWrite=%b, Branch=%b, Jump=%b, ALUop=%b, MemRead=%b, MemWrite=%b, RegWriteSource=%b, ALUSource=%b",
                 RegDst, RegWrite, Branch, Jump, ALUop, MemRead, MemWrite, RegWriteSource, ALUSource);
        
        opcode = 4'b0011;
        #10;
       $display("addi => RegDst=%b, RegWrite=%b, Branch=%b, Jump=%b, ALUop=%b, MemRead=%b, MemWrite=%b, RegWriteSource=%b, ALUSource=%b",
                 RegDst, RegWrite, Branch, Jump, ALUop, MemRead, MemWrite, RegWriteSource, ALUSource);
       
        opcode = 4'b0100;
        #10;
        $display("beq => RegDst=%b, RegWrite=%b, Branch=%b, Jump=%b, ALUop=%b, MemRead=%b, MemWrite=%b, RegWriteSource=%b, ALUSource=%b",
                 RegDst, RegWrite, Branch, Jump, ALUop, MemRead, MemWrite, RegWriteSource, ALUSource);
        
        opcode = 4'b0101;
        #10;
        $display("bne => RegDst=%b, RegWrite=%b, Branch=%b, Jump=%b, ALUop=%b, MemRead=%b, MemWrite=%b, RegWriteSource=%b, ALUSource=%b",
                 RegDst, RegWrite, Branch, Jump, ALUop, MemRead, MemWrite, RegWriteSource, ALUSource);
        
        opcode = 4'b0110;
        #100;
        $display("jmp => RegDst=%b, RegWrite=%b, Branch=%b, Jump=%b, ALUop=%b, MemRead=%b, MemWrite=%b, RegWriteSource=%b, ALUSource=%b",
                 RegDst, RegWrite, Branch, Jump, ALUop, MemRead, MemWrite, RegWriteSource, ALUSource);
        
         opcode = 4'b0000;
        function_code = 4'b0000;  
        #10;
       $display("add => RegDst=%b, RegWrite=%b, Branch=%b, Jump=%b, ALUop=%b, MemRead=%b, MemWrite=%b, RegWriteSource=%b, ALUSource=%b",
                 RegDst, RegWrite, Branch, Jump, ALUop, MemRead, MemWrite, RegWriteSource, ALUSource);
        
        
        opcode = 4'b0000;
        function_code = 4'b0001;  
        #10;
       $display("sub => RegDst=%b, RegWrite=%b, Branch=%b, Jump=%b, ALUop=%b, MemRead=%b, MemWrite=%b, RegWriteSource=%b, ALUSource=%b",
                 RegDst, RegWrite, Branch, Jump, ALUop, MemRead, MemWrite, RegWriteSource, ALUSource);
        
        opcode = 4'b0000;
        function_code = 4'b0010;  
        #10;
       $display("sll => RegDst=%b, RegWrite=%b, Branch=%b, Jump=%b, ALUop=%b, MemRead=%b, MemWrite=%b, RegWriteSource=%b, ALUSource=%b",
                 RegDst, RegWrite, Branch, Jump, ALUop, MemRead, MemWrite, RegWriteSource, ALUSource);
        
        opcode = 4'b0000;
        function_code = 4'b0011;  
        #10;
        $display("and => RegDst=%b, RegWrite=%b, Branch=%b, Jump=%b, ALUop=%b, MemRead=%b, MemWrite=%b, RegWriteSource=%b, ALUSource=%b",
                 RegDst, RegWrite, Branch, Jump, ALUop, MemRead, MemWrite, RegWriteSource, ALUSource);
        $finish;
    end
endmodule

