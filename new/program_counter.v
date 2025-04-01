module program_counter (
    input clk,                   // Clock signal
    input reset,                 // Reset signal
    input [15:0] next_pc,        // Next PC value from MUX
    output reg [15:0] PC         // Current PC value
);

always @(posedge clk) begin
    if (reset) 
        PC <= 16'b0; // Reset PC to 0
    else 
        PC <= next_pc; // Update PC from MUX output
end





// Monitor block to track PC and reset behavior
    initial begin
        $monitor("Time insidePC: %t | PC: %h | Reset: %b | Clock: %b", $time, PC, reset, clk);
    end

endmodule