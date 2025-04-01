`timescale 1ns / 1ps


module register_file (
    input clk,
    input reset,
    input  [3:0]  RegRead1, 
    input  [3:0]  RegRead2,
    input  [3:0]  WriteReg,
    input  [15:0] WriteData,
    input         RegWrite,
    output wire [15:0] ReadData1,
    output wire [15:0] ReadData2
);
    
    reg [15:0] registers [0:15];
    
   
    assign ReadData1 = registers[RegRead1];
    assign ReadData2 = registers[RegRead2];
    
    integer i;
    
    always @(posedge clk) begin
    
    if(reset) begin
    for (i=0; i<16; i=i+1) begin
        registers[i] <= 16'd0;
        end
    end else begin
        
        if (RegWrite)
            registers[WriteReg] <= WriteData;
        end
    end
    
      initial begin
    $monitor("Time inside RF: %t |R1: %h|R2: %h|R3: %h||R4: %h||R5: %h||R6: %h||R7: %h| Regread1: %h | reset: %h", $time, registers[1],registers[2],registers[3],registers[4],registers[5],registers[6],registers[7], RegRead1, reset);
  end
    
    
    
endmodule