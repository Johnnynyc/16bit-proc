`timescale 1ns / 1ps
module register_file (
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
    
    always @(*) begin
        if (RegWrite)
            registers[WriteReg] = WriteData;
    end
endmodule
