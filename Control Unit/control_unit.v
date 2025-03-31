`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 05:15:05 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(clk,opcode,function_code,RegDst,RegWrite, Branch,Jump,ALUop, MemRead,MemWrite,RegWriteSource,ALUSource);
    input clk;    
    input [3:0] opcode;
    input [3:0] function_code;
    output reg RegDst;
    output reg RegWrite;
    output reg Branch;
    output reg Jump;
    output reg [3:0]ALUop;
    output reg MemRead;
    output reg MemWrite;
    output reg RegWriteSource;
    output reg ALUSource;
    
    initial begin
        RegDst =0;
        RegWrite=0;
        Branch=0;
        Jump=0;
        ALUop=4'b0000;
        MemRead=0;     
        MemWrite=0;
        RegWriteSource=0;
        ALUSource=0;
    end
    
    always @(*)
        begin
        case(opcode)
            4'b0000: begin 
                case(function_code)
                    4'b0000: begin //add
                        RegDst = 1;       
                        RegWrite = 1;
                        Branch = 0;
                        Jump = 0;
                        ALUop = 4'b0000;
                        MemRead = 0;
                        MemWrite = 0;
                        RegWriteSource = 0;
                    end
                    4'b0001: begin //sub
                        RegDst = 1;       
                        RegWrite = 1;
                        Branch = 0;
                        Jump = 0;
                        ALUop = 4'b0001;
                        MemRead = 0;
                        MemWrite = 0;
                        RegWriteSource = 0;
                    end
                    4'b0010: begin //sll
                        RegDst = 1;       
                        RegWrite = 1;
                        Branch = 0;
                        Jump = 0;
                        ALUop = 4'b0010;
                        MemRead = 0;
                        MemWrite = 0;
                        RegWriteSource = 0;
                    end
                    4'b0011: begin //and
                        RegDst = 1;       
                        RegWrite = 1;
                        Branch = 0;
                        Jump = 0;
                        ALUop = 4'b0011;
                        MemRead = 0;
                        MemWrite = 0;
                        RegWriteSource = 0;
                    end
                endcase
            end
            
            4'b0001: begin //lw
                RegDst = 0;       
                RegWrite = 1;
                Branch = 0;
                Jump = 0;
                ALUop = 4'b0000;
                MemRead = 1;
                MemWrite = 0;
                RegWriteSource = 1;
                ALUSource = 1;
            end
            
            4'b0010: begin //sw
                RegDst = 0;      
                RegWrite = 0;
                Branch = 0;
                Jump = 0;
                ALUop = 4'b0000;
                MemRead = 0;
                MemWrite = 1;
                RegWriteSource = 0; 
                ALUSource = 1;
            end
            
            4'b0011: begin //addi
                RegDst = 0;       
                RegWrite = 1;
                Branch = 0;
                Jump = 0;
                ALUop = 4'b0000;
                MemRead = 0;
                MemWrite = 0;
                RegWriteSource = 0;
                ALUSource = 1;
            end
            
            4'b0100: begin //beq
                RegDst = 0;       
                RegWrite = 0;
                Branch = 1;
                Jump = 0;
                ALUop = 4'b0001;
                MemRead = 0;
                MemWrite = 0;
                RegWriteSource = 0;
                ALUSource = 0;
            end
            
            4'b0101: begin //bne
                RegDst = 0;
                RegWrite = 0;
                Branch = 1;
                Jump = 0;
                ALUop = 4'b0001;
                MemRead = 0;
                MemWrite = 0;
                RegWriteSource = 0;
                ALUSource = 0;

            end
            
            4'b0110: begin //jmp
                RegDst = 0;
                RegWrite = 0;
                Branch = 0;
                Jump = 1;
                ALUop = 4'b0000; // May not be used
                MemRead = 0;
                MemWrite = 0;
                RegWriteSource = 0;
                ALUSource = 0;
            end
        endcase
    end
endmodule

        
   
                
