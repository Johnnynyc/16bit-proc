module mux(
    input [15:0] I0,        //register data 2
    input [15:0] I1,        //sign extended value
    input Selector,
    output [15:0] Output,
    output temp1,
    output temp2
);

    assign temp1 = I0 & ~Selector;
    assign temp2 = I1 & Selector;
    assign Output = temp1 | temp2;

endmodule
