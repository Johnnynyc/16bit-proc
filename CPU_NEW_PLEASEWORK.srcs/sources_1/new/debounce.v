`timescale 1ns / 1ps

module debounce(
    input clk,               // System clock
    input rst,               // Reset signal
    input pb,                // Push button input
    output reg pb_debounced  // Debounced output signal
);
    reg [19:0] counter;  // 20-bit counter for debouncing (you can adjust the size based on your clock speed)

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            pb_debounced <= 0;
        end else begin
            if (pb == pb_debounced) begin
                counter <= 0;  // Reset counter if the button state has not changed
            end else if (counter == 20'd999999) begin  // Adjust the debounce delay (depends on clock speed)
                pb_debounced <= pb;  // Update debounced signal when counter threshold is reached
            end else begin
                counter <= counter + 1;  // Increment counter while waiting for stable signal
            end
        end
    end
endmodule
