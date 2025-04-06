module alu(
    input [15:0] A,
    input [15:0] B,
    input [3:0] Opcode,
    output reg [15:0] Output,
    input clk
);

always @(*) begin

    case(Opcode)
    
        4'b0000: begin
        Output = A + B;  
        end          //addition
        4'b0001: begin
        Output = A - B;  
        end          //subtraction
        4'b0010: begin
        Output = B << A;   
        end        //SLL
        4'b0011: begin
        Output = A & B;   
        end         //AND
    endcase

end

  initial begin
   // $monitor("Time inside ALU: %t A: %b | B: %b | opcode: %b | out: %b", $time, A, B, Opcode, Output);
  end

endmodule