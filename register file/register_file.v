`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 05:17:33 PM
// Design Name: 
// Module Name: register_file
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


module register_file (
    input clk,
    input reset,
    input  [3:0]  RegRead1, 
    input  [3:0]  RegRead2,
    input  [3:0]  WriteReg,
    input  [15:0] WriteData,
    input         RegWrite,
    output [15:0] ReadData1,
    output [15:0] ReadData2
);
    
    reg [15:0] registers [0:15];
    assign ReadData1 = registers[RegRead1];
    assign ReadData2 = registers[RegRead2];
    integer i;
    
    always @(negedge clk)  begin
    if(reset) begin
    for (i=0; i<16; i=i+1) begin
        registers[i] <=16'b0;
        end
    end else begin
        if (RegWrite)
            registers[WriteReg] <= WriteData;
        end
    end
endmodule
