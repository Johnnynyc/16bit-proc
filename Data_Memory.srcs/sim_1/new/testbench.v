`timescale 1ns / 1ps


module testbench;
    
    reg WriteEnable = 0;
    reg ReadEnable = 0;
    reg [5:0] SourceAddress = 0;
    reg [15:0] InputData = 0;
    reg reset = 0;
    reg clk = 1;
    wire [15:0] OutputData;
    
    // Unit under test (UUT)
    top uut(
        .WriteEnable (WriteEnable),
        .ReadEnable (ReadEnable),
        .SourceAddress (SourceAddress), 
        .InputData (InputData), 
        .reset (reset),
        .clk (clk),
        .OutputData (OutputData)
    );
    
    integer i = 0;
    
    initial 
    begin
    
    SourceAddress = 1;
    InputData = 16;
    #10 WriteEnable = 1;
    #10 WriteEnable = 0;
    
    
    
    
    ReadEnable = 1;
    for(i = 0; 1<4; i = i + 1) begin
        
        #10 SourceAddress = i;
    
    end
    
    
    end
    
endmodule
