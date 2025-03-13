module mux_tb;
    reg I0, I1, Selector;
    wire Output, temp1, temp2;


mux utt(
    .I0(I0),
    .I1(I1),
    .Selector(Selector),
    .Output(Output),
    .temp1(temp1),
    .temp2(temp2)
);

initial begin
    
    I0 = 0;
    I1 = 0;
    Selector = 0;
    #10
    $display("I0 = %b, I1 = %b, Selector = %b, Output = %b", I0, I1, Selector, Output);


    I0 = 0;
    I1 = 1;
    Selector = 0;
    #10
    $display("I0 = %b, I1 = %b, Selector = %b, Output = %b", I0, I1, Selector, Output);

    I0 = 1;
    I1 = 0;
    Selector = 1;
    #10
    $display("I0 = %b, I1 = %b, Selector = %b, Output = %b", I0, I1, Selector, Output);

    I0 = 1;
    I1 = 1;
    Selector = 1;
    #10
    $display("I0 = %b, I1 = %b, Selector = %b, Output = %b", I0, I1, Selector, Output);

    $finish;
end

endmodule
