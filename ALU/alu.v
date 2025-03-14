module alu(
    input [15:0] A,
    input [15:0] B,
    input [3:0] Opcode,
    output reg [15:0] Output
);

always @(*) begin

    case(Opcode)
        4'b0000: Output = A + B;            //addition
        4'b0001: Output = A - B;            //subtraction
        4'b0010: Output = A << B;           //SLL
        4'b0011: Output = A & B;            //AND
    endcase

end

endmodule
