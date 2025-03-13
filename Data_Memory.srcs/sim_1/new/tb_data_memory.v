`timescale 1ns / 1ps

// tb_data_memory.v - Testbench for Data_Memory module
module tb_data_memory;

    // Declare signals for the testbench
    reg WriteEnable;
    reg ReadEnable;
    reg [7:0] SourceAddress;
    reg [15:0] InputData;
    wire [15:0] OutputData;
    reg reset;
    reg clk;

    // Instantiate the Data_Memory module (Unit Under Test)
    Data_Memory uut (
        .WriteEnable(WriteEnable),
        .ReadEnable(ReadEnable),
        .SourceAddress(SourceAddress),
        .InputData(InputData),
        .OutputData(OutputData),
        .reset(reset),
        .clk(clk)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // Toggle clock every 5 time units (100 MHz clock)
    end

    // Stimulus generation
    initial begin
        // Initial values
        clk = 0;
        reset = 1;
        WriteEnable = 0;
        ReadEnable = 0;
        SourceAddress = 6'b0;
        InputData = 16'b0;

        // Reset the memory for 10 time units
        #10 reset = 0;

        // Test 1: Write data to address 0
        #10 WriteEnable = 1;
            SourceAddress = 8'b00000000;
            InputData = 16'hA5A5;
        #10 WriteEnable = 0;  // Disable write

        // Test 2: Read data from address 0
        #10 ReadEnable = 1;
            SourceAddress = 8'b00000000;
        #10 ReadEnable = 0;  // Disable read

        // Test 3: Write data to address 1
        #10 WriteEnable = 1;
            SourceAddress = 8'b00000001;
            InputData = 16'h8001;
        #10 WriteEnable = 0;

        // Test 4: Read data from address 1
        #10 ReadEnable = 1;
            SourceAddress = 8'b00000001;
        #10 ReadEnable = 0;

        // Test 5: Write data to address 2
        #10 WriteEnable = 1;
            SourceAddress = 8'b00000010;
            InputData = 16'h3C3C;
        #10 WriteEnable = 0;

        // Test 6: Read data from address 2
        #10 ReadEnable = 1;
            SourceAddress = 8'b00000010;
        #10 ReadEnable = 0;

        // End of test
        #10 $finish;  // End simulation
    end

    // Monitor the output (printing the values)
    initial begin
        $monitor("At time %t, Address = %b, InputData = %b, OutputData = %b, ReadEnable = %b, WriteEnable = %b",  $time, SourceAddress, InputData, OutputData, ReadEnable, WriteEnable);
    end

endmodule
