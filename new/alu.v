module alu(
    input [15:0] A,
    input [15:0] B,
    input [3:0] Opcode,
    output reg [15:0] Output,
    input clk
);

always @(posedge clk) begin

    case(Opcode)
    
        4'b0000: begin
        Output = A + B;  
        end          //addition
        4'b0001: begin
        Output = A - B;  
        end          //subtraction
        4'b0010: begin
        Output = A << B;   
        end        //SLL
        4'b0011: begin
        Output = A & B;   
        end         //AND
    endcase

end

endmodule