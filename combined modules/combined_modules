`timescale 1ns / 1ps

module program_counter (
    input clk,                   // Clock signal
    input reset,                 // Reset signal
    input [15:0] next_pc,        // Next PC value from MUX
    output reg [15:0] PC         // Current PC value
);

always @(posedge clk or posedge reset) begin
    if (reset) 
        PC <= 16'b0; // Reset PC to 0
    else 
        PC <= next_pc; // Update PC from MUX output
end

endmodule

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

//THIS MODULE HOLDS THE FILE AND ITS CODE, IT GIVES THE CPU COMPONENTS ITS DATA
module instruction_memory(
    
    input [15:0] address,        // Address of the instruction to fetch
    output wire [15:0] instruction, // 16-bit instruction fetched from memory
    input clk

    );
    // Memory array for 64 locations, each 16 bits wide
    reg [15:0] memory [63:0];
    reg [15:0] OutputReg;  // Internal reg to hold the output value
    reg [3:0] opcode;
    integer i = 1;
   
    
    assign OutputData = instruction;
    
    always @ (posedge clk) begin
    if (i == 1) begin
        $readmemb("./memfile.txt",memory,0,4);
        i = 0;
    end
    
    OutputReg <= memory[address];
    
    end
    
    
endmodule

module Data_Memory(
    input WriteEnable,
    input ReadEnable,
    input [7:0] SourceAddress,
    input [15:0] InputData,
    output [15:0] OutputData,
    input reset,
    input clk
    );
    
    // Memory array for 64 locations, each 16 bits wide
    reg [15:0] memory [63:0];
    reg [15:0] OutputReg;  // Internal reg to hold the output value
    integer i;
    
    
    // Assign internal reg to the OutputData wire
    assign OutputData = OutputReg;  // Continuously assign internal reg to outputdata
        
    
    always @ (posedge clk) begin
    
        //memory[0] = 3;
        //memory[2] = 4;
    
        if (reset) begin
            for(i = 0; i < 64; i = i + 1) begin
                memory[i] <= 16'b0;
        
            end
            OutputReg <= 16'b0;
        end 
        
        else begin
            
            if (WriteEnable) begin
            //writing data to memory,
            
            memory[SourceAddress] <= InputData;
            end
            
            if (ReadEnable) begin 
            OutputReg <= memory[SourceAddress];
           end
    
    end
    end
endmodule

module control_unit(opcode,function_code,RegDst,RegWrite, Branch,Jump,ALUop, MemRead,MemWrite,RegWriteSource,ALUSource);
    input [3:0] opcode;
    input [3:0] function_code;
    output reg RegDst;
    output reg RegWrite;
    output reg Branch;
    output reg Jump;
    output reg [3:0]ALUop;
    output reg MemRead;
    output reg MemWrite;
    output reg RegWriteSource;
    output reg ALUSource;
    
    initial begin
        RegDst =0;
        RegWrite=0;
        Branch=0;
        Jump=0;
        ALUop=4'b0000;
        MemRead=0;     
        MemWrite=0;
        RegWriteSource=0;
        ALUSource=0;
    end
    
    always @(*)
        begin
        case(opcode)
            4'b0000: begin //R-type: add, sub, sll, and
                RegDst =1;
                RegWrite =1;
                case(function_code)
                    4'b0000: ALUop = 4'b0000;
                    4'b0001: ALUop = 4'b0001;
                    4'b0010: ALUop = 4'b0010;
                    4'b0011: ALUop = 4'b0011;
                endcase
            end
            
            4'b0001: begin //lw
                RegWrite =1;
                RegWriteSource = 1;  
                ALUSource =1;
                MemRead =1;
                ALUop =4'b0000;
            end
            
            4'b0010: begin //sw
            ALUSource = 1;
            MemWrite  = 1;
            ALUop     = 4'b0000; 
            end
            
            4'b0011: begin //addi
            RegWrite  = 1;
            ALUSource = 1;
            ALUop     = 4'b0000; 
            end
            
            4'b0100: begin //beq
            Branch =1;
            ALUop     = 4'b0001; 
            end
            
            4'b0101: begin //bne
            Branch =1;
            ALUop     = 4'b0001; 
            end
            
            4'b0110: begin //jmp
            Jump =1;
            end
        endcase
    end
endmodule

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

module register_file (
    input  [3:0]  RegRead1, 
    input  [3:0]  RegRead2,
    input  [3:0]  WriteReg,
    input  [15:0] WriteData,
    input         RegWrite,
    output [15:0] ReadData1,
    output [15:0] ReadData2
);
    
    reg [15:0] registers [0:15];
    assign ReadData1 = registers[RegRead1];
    assign ReadData2 = registers[RegRead2];
    
    always @(*) begin
        if (RegWrite)
            registers[WriteReg] = WriteData;
    end
endmodule

module signExtension(
    input [3:0] immediate,                  //4 bit immediate from I-type
    output [15:0] result
);

    assign result = {{12{immediate[3]}}, immediate};        //replicate sign-bit 12 times, add immediate

endmodule
