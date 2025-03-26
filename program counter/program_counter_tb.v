`timescale 1ns / 1ps

module program_counter_tb;

    reg clk;
    reg reset;
    reg [15:0] next_pc;

    wire [15:0] PC;

    program_counter uut (
        .clk(clk),
        .reset(reset),
        .next_pc(next_pc),
        .PC(PC)
    );

    // 10ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        next_pc = 16'h0000;

        #10;
        reset = 0;

        // Test next pc
        #10 next_pc = 16'h0004;
        #10 next_pc = 16'h0008;
        #10 next_pc = 16'h000C;

        // Apply reset
        #10 reset = 1;
        #10 reset = 0;

        // Test after reset
        #10 next_pc = 16'h0010;
        #10 next_pc = 16'h0014;

        #20 $finish;
    end

    initial begin
        $monitor("Time: %0dns | Reset: %b | next_pc: %h | PC: %h", $time, reset, next_pc, PC);
    end

endmodule
