`timescale 1ns / 1ps



module control_unit(opcode,function_code,clk,RegDst,RegWrite, Branch,Jump,ALUop, MemRead,MemWrite,RegWriteSource,ALUSource);
    input [3:0] opcode;
    input [3:0] function_code;
    input clk;
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
            4'b0000: begin //R-type: add, sub, sll, and
                RegDst =1;
                RegWrite =1;
          
                Branch = 0;
                Jump = 0;
                MemRead = 0;
                MemWrite = 0;
                RegWriteSource = 0;
                ALUSource = 0;
                
                case(function_code)
                    4'b0000: ALUop = 4'b0000;
                    4'b0001: ALUop = 4'b0001;
                    4'b0010: ALUop = 4'b0010;
                    4'b0011: ALUop = 4'b0011;
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

        
   
                