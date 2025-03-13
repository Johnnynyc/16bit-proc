module mux(
    input I0,
    input I1,
    input Selector,
    output Output,
    output temp1,
    output temp2
);

    assign temp1 = I0 & ~Selector;
    assign temp2 = I1 & Selector;
    assign Output = temp1 | temp2;

endmodule
