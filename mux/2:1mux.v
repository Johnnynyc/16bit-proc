//iverilog -o mux.vvp mux.v mux_tb.v
//vvp mux.vvp

module mux(
    input [15:0] I0,        //register data 2
    input [15:0] I1,        //sign extended value
    input Selector,
    output reg [15:0] Output,
    output temp1,
    output temp2
);

always @(*) begin
    case(Selector)
        0: begin
            Output = I0;
        end

        1: begin
            Output = I1;
        end
    endcase

end
endmodule
