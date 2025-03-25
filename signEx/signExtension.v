module signExtension(
    input [3:0] immediate,                  //4 bit immediate from I-type
    output [15:0] result
);

    assign result = {{12{immediate[3]}}, immediate};        //replicate sign-bit 12 times, add immediate

endmodule
