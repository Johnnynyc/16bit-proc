module mux(
    input [15:0] I0,        //register data 2
    input [15:0] I1,        //sign extended value
    input Selector,
    input clk,
    output reg [15:0] Output,
    output temp1,
    output temp2
);

    
    always @(*) begin
    case(Selector)
        1'b0: begin
        Output = I0;
        end
        
        1'b1: begin
        Output = I1;
        end
        
        endcase
    
    end

endmodule