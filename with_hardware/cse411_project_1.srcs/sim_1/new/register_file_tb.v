`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 04:48:13 PM
// Design Name: 
// Module Name: register_file_test
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



module register_file_tb;
    reg clk;
    reg reset;
    reg[3:0] RegRead1;
    reg[3:0]RegRead2;
    reg[3:0] WriteReg;
    reg[15:0] WriteData;
    reg RegWrite;
    wire[15:0] ReadData1;
    wire[15:0] ReadData2;
    
    register_file uut(
    .clk(clk),
    .reset(reset),
    .RegRead1(RegRead1),
    .RegRead2(RegRead2),
    .WriteReg (WriteReg),
    .WriteData (WriteData),
    .RegWrite(RegWrite),
    .ReadData1(ReadData1),
    .ReadData2 (ReadData2)
    );
     always #5 clk = ~clk;


    initial begin
        clk =0;
        reset = 1;
        RegRead1 = 4'b0;
        RegRead2 = 4'b1;
        RegWrite = 0;
        WriteReg = 4'b0;
        WriteData = 16'b0;
        #10;
        
        reset=0;
        RegRead1 =4'b0;
        RegRead2 =4'b1;
        RegWrite =0;
        #10;
        $display("RegRead1=%b, ReadData1=%b,RegRead2=%b, ReadData2=%b",RegRead1, ReadData1,RegRead2, ReadData2); 
        
         WriteReg = 4'b1;  
         WriteData = 16'b1111000011110000;
         RegWrite = 1;
         #10; 
         
         RegWrite = 0;
         RegRead1 = 4'b0;
         RegRead2 = 4'b1;
         #10;
         $display("RegRead1=%b, ReadData1=%b, RegRead2=%b, ReadData2=%b", RegRead1, ReadData1, RegRead2, ReadData2);
         
         $finish;     
            
    end
    
    
endmodule