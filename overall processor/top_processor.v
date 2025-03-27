`timescale 1ns / 1ps

module processor (
    input clk,
    input reset
);

// Internal Wires
wire [15:0] pc_current;
wire [15:0] pc_next;
wire [15:0] instruction;

// Decode instruction fields
wire [3:0] opcode        = instruction[15:12];
wire [3:0] rs            = instruction[11:8];
wire [3:0] rt            = instruction[7:4];
wire [3:0] rd_or_imm     = instruction[3:0];  // used for func_code or immediate

wire [15:0] read_data1;
wire [15:0] read_data2;
wire [15:0] alu_src_mux_out;
wire [15:0] alu_result;

wire [15:0] sign_ext_imm;
wire [15:0] mem_read_data;

// Control signals
wire reg_dst;
wire reg_write;
wire branch;
wire jump;
wire [3:0] alu_op;
wire mem_read;
wire mem_write;
wire reg_write_src;
wire alu_src;

// Branch/jump logic
wire zero_flag        = (read_data1 == read_data2);
wire not_equal_flag   = (read_data1 != read_data2);
wire bne              = (opcode == 4'b0101); // Opcode for bne

// Write-back logic
wire [3:0] write_reg   = (reg_dst) ? rd_or_imm : rt;
wire [15:0] write_data = (reg_write_src) ? mem_read_data : alu_result;

// Program Counter update logic
wire [15:0] pc_plus_2      = pc_current + 2;
wire [15:0] branch_offset  = sign_ext_imm << 1;
wire [15:0] branch_target  = pc_plus_2 + branch_offset;

wire [15:0] jmp_offset     = {{4{instruction[11]}}, instruction[11:0]} << 1;
wire [15:0] jump_target    = pc_plus_2 + jmp_offset;

assign pc_next = (jump)                          ? jump_target :
                 (branch && zero_flag)           ? branch_target :
                 (bne && not_equal_flag)         ? branch_target :
                 pc_plus_2;

// Module Instantiations

program_counter PC (
    .clk(clk),
    .reset(reset),
    .next_pc(pc_next),
    .PC(pc_current)
);

instruction_memory IMEM (
    .address(pc_current),
    .instruction(instruction),
    .clk(clk)
);

control_unit CTRL (
    .opcode(opcode),
    .function_code(rd_or_imm),  // also used as func_code
    .RegDst(reg_dst),
    .RegWrite(reg_write),
    .Branch(branch),
    .Jump(jump),
    .ALUop(alu_op),
    .MemRead(mem_read),
    .MemWrite(mem_write),
    .RegWriteSource(reg_write_src),
    .ALUSource(alu_src)
);

register_file RF (
    .RegRead1(rs),
    .RegRead2(rt),
    .WriteReg(write_reg),
    .WriteData(write_data),
    .RegWrite(reg_write),
    .ReadData1(read_data1),
    .ReadData2(read_data2)
);

signExtension SE (
    .immediate(rd_or_imm),
    .result(sign_ext_imm)
);

wire temp1, temp2;
mux ALU_SRC_MUX (
    .I0(read_data2),
    .I1(sign_ext_imm),
    .Selector(alu_src),
    .Output(alu_src_mux_out),
    .temp1(temp1),
    .temp2(temp2)
);

alu ALU (
    .A(read_data1),
    .B(alu_src_mux_out),
    .Opcode(alu_op),
    .Output(alu_result)
);

Data_Memory DMEM (
    .WriteEnable(mem_write),
    .ReadEnable(mem_read),
    .SourceAddress(alu_result[7:0]),  // lower byte only for 64-byte address space
    .InputData(read_data2),
    .OutputData(mem_read_data),
    .reset(reset),
    .clk(clk)
);

endmodule
