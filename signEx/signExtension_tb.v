module signExtension_tb;
    reg [3:0] immediate;
    wire [15:0] result;

signExtension uut(
    .immediate(immediate),
    .result(result)
);

initial begin
    
    immediate = 4'b0011;
    #10;
    $display("immediate = %d, result = %b", immediate, result);

    $display();

    immediate = 4'b1001;
    #10;
    $display("immediate = %d, result = %b", $signed(immediate), result);

    $finish;

end

endmodule
