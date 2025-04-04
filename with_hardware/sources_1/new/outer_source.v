`timescale 1ns / 1ps

module processor (
    input clk,
    input reset,
    output [15:0] Output
);


// Instruction Wires
wire [15:0] pc_current;
wire [15:0] pc_next;
wire [15:0] instruction;

// Instruction Decoding
wire [3:0] opcode      = instruction[15:12];
wire [3:0] dest        = instruction[11:8];  // rt/rd (write destination)
wire [3:0] src         = instruction[7:4];   // rs
wire [3:0] imm_or_fn   = instruction[3:0];   // immediate (I-type) or func_code (R-type)
wire [11:0] jmp_addr   = instruction[11:0];  // jump target (J-type)

// Datapath Wires
wire [15:0] read_data1;
wire [15:0] read_data2;
wire [15:0] alu_src_mux_out;
wire [15:0] alu_result;
wire [15:0] sign_ext_imm;
wire [15:0] mem_read_data;

// Control Signals
wire reg_dst;
wire reg_write;
wire branch;
wire jump;
wire [3:0] alu_op;
wire mem_read;
wire mem_write;
wire reg_write_src;
wire alu_src;

// Flags for Branching
wire zero_flag        = (read_data1 == read_data2);
wire not_equal_flag   = (read_data1 != read_data2);
wire bne              = (opcode == 4'b0101); // bne opcode
wire beq = (opcode == 4'b0100);

// Write-back Logic
wire [3:0] write_reg   = dest;  // Always writing to bits 11:8 for both R/I types
wire [15:0] write_data = (reg_write_src) ? mem_read_data : alu_result;

// Program Counter Update
wire [15:0] pc_plus_2      = pc_current + 2;
wire [15:0] branch_offset  = sign_ext_imm << 1;
wire [15:0] branch_target  = pc_plus_2 + branch_offset;
wire [15:0] jmp_offset     = {{4{jmp_addr[11]}}, jmp_addr} << 1;
wire [15:0] jump_target    = pc_plus_2 + jmp_offset;

//immediate is left shifted 1, added to pc + 2 (Next address of pc), 

//----------------------------

assign pc_next = (jump)                          ? jump_target :
                 (branch && zero_flag && beq)           ? branch_target :
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
    .function_code(imm_or_fn), // R-type: func_code (bits 3:0)
    .RegDst(reg_dst),
    .RegWrite(reg_write),
    .Branch(branch),
    .Jump(jump),
    .ALUop(alu_op),
    .MemRead(mem_read),
    .MemWrite(mem_write),
    .RegWriteSource(reg_write_src),
    .ALUSource(alu_src),
    .clk(clk)
);

register_file RF (
    .RegRead1(src),
    .RegRead2(dest),
    .WriteReg(write_reg),
    .WriteData(write_data),
    .RegWrite(reg_write),
    .ReadData1(read_data1),
    .ReadData2(read_data2),
    .clk(clk),
    .reset(reset)
);

signExtension SE (
    .immediate(imm_or_fn),
    .result(sign_ext_imm),
    .clk(clk)
);

wire temp1, temp2;
mux ALU_SRC_MUX (
    .I0(read_data2),
    .I1(sign_ext_imm),
    .Selector(alu_src),
    .Output(alu_src_mux_out),
    .temp1(temp1),
    .temp2(temp2),
    .clk(clk)
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
    .SourceAddress(alu_result[7:0]),  // 64-byte memory address space
    .InputData(read_data2),
    .OutputData(mem_read_data),
    .reset(reset),
    .clk(clk)
);
assign Output = write_data;

endmodule