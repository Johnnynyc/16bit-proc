`timescale 1ns / 1ps


module real_top(
    input clk,            // System clock (e.g., 100 MHz on Basys 3)
    input rst,            // Reset signal
    input btn,            // Push button (for clock input)
    output [7:0] led      // 8 LEDs (for output visualization)
    );


    // Instantiate debounce module
    wire pb_debounced;
    debounce debounce_inst (
        .clk(clk),
        .rst(rst),
        .pb(btn),
        .pb_debounced(pb_debounced)
    );

    // Counter that increments on each push button press (acting as a clock)
    reg [7:0] counter;
    always @(posedge pb_debounced or posedge rst) begin
        if (rst) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

    // Output the counter value to LEDs
    assign led = counter;

endmodule
