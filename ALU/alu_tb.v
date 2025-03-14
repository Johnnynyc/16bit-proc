module alu_tb;
    reg [15:0] A;
    reg [15:0] B;
    reg [3:0] Opcode;
    wire [15:0] Output;

alu uut(
    .A(A),
    .B(B),
    .Opcode(Opcode),
    .Output(Output)
);

initial begin

    A = 16'h0001;
    B = 16'h0002;
    Opcode = 4'b0000;
    #10;
    $display("ADDITION: A = %h, B = %h, Opcode = %b, Output = %h", A, B, Opcode, Output);

    A = 16'h0012;
    B = 16'h0003;
    Opcode = 4'b0000;
    #10;
    $display("ADDITION: A = %h, B = %h, Opcode = %b, Output = %h", A, B, Opcode, Output);

    $display();

    A = 16'h0008;
    B = 16'h0003;
    Opcode = 4'b0001;
    #10;
    $display("SUBTRACTION: A = %h, B = %h, Opcode = %b, Output = %h", A, B, Opcode, Output);

    A = 16'h00E7;
    B = 16'h00A1;
    Opcode = 4'b0001;
    #10;
    $display("SUBTRACTION: A = %h, B = %h, Opcode = %b, Output = %h", A, B, Opcode, Output);

    $display();

    A = 16'h0002;
    B = 16'h0001;
    Opcode = 4'b0010;
    #10;
    $display("SHIFT LEFT LOG: A = %h, B = %h, Opcode = %b, Output = %h", A, B, Opcode, Output);

    A = 16'h000F;
    B = 16'h0004;
    Opcode = 4'b0010;
    #10;
    $display("SHIFT LEFT LOG: A = %h, B = %h, Opcode = %b, Output = %h", A, B, Opcode, Output);

    $display();

    A = 16'hFFFF;
    B = 16'h000F;
    Opcode = 4'b0011;
    #10;
    $display("BITWISE AND: A = %h, B = %h, Opcode = %b, Output = %h", A, B, Opcode, Output);

    A = 16'h0000;
    B = 16'h0001;
    Opcode = 4'b0011;
    #10;
    $display("BITWISE AND: A = %h, B = %h, Opcode = %b, Output = %h", A, B, Opcode, Output);

    $display();

    $finish;
end


endmodule
