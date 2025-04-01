`timescale 1ns / 1ps

module Data_Memory(
    input WriteEnable,
    input ReadEnable,
    input [7:0] SourceAddress,
    input [15:0] InputData,
    output [15:0] OutputData,
    input reset,
    input clk
    );
    
    // Memory array for 64 locations, each 16 bits wide
    reg [15:0] memory [63:0];
    reg [15:0] OutputReg;  // Internal reg to hold the output value
    integer i;
    
    
    // Assign internal reg to the OutputData wire
    assign OutputData = OutputReg;  // Continuously assign internal reg to outputdata
        
    
    always @ (negedge clk) begin
    
        //memory[0] = 3;
        //memory[2] = 4;
    
        if (reset) begin
            for(i = 0; i < 64; i = i + 1) begin
                memory[i] <= 16'b0;
        
            end
            OutputReg <= 16'b0;
        end 
        
        else begin
            
            if (WriteEnable) begin
            //writing data to memory,
            
            memory[SourceAddress] <= InputData;
            end
            
            if (ReadEnable) begin 
            OutputReg <= memory[SourceAddress];
           end
    
    end
    end
endmodule
