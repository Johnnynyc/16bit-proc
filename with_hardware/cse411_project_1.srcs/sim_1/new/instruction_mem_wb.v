`timescale 1ns / 1ps


module instruction_mem_wb;

    reg [15:0] address;        // Address of the instruction to fetch
    wire [15:0] instruction; // 16-bit instruction fetched from memory
    reg clk;
    
    
    
    instruction_memory uut (
    .address(address),
    .instruction(instruction),
    .clk(clk)
    
    );
    
     // Clock generation
    always begin
        #5 clk = ~clk;  // Toggle clock every 5 time units (100 MHz clock)
    end
    
    initial begin
        // Initial values
        clk = 0;
        
        #10 address = 16'h0000;
        
        #10;
        
        #10 address = 16'h0001;
        
        #10;
        
        #10 address = 16'h0002;
        
        #10;
        
        #10 address = 16'h0003;
        
        #10;
        
        
 end
 
 
 // Monitor the output (printing the values)
    initial begin
        $monitor("At time %t, Address = %b, instruction = %b",  $time, address, instruction);
    end
    
    
endmodule