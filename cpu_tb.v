`timescale 1ns / 1ps

module processor_tbtest;
  reg clk;
  reg reset;


  processor uut (
    .clk(clk),
    .reset(reset)
  );

  // Clock Generation (50MHz clock)
  always begin
    #10 clk = ~clk; // Toggle clock every 10ns (50MHz)
  end

  initial begin
    // Initialize signals
    clk = 0;
    #5 reset = 1;
    
    #100
    reset = 0;
    

    // Add test instructions, if needed

    // End the simulation after a few clock cycles
    #200;
    $finish;
  end
  

  // Monitor important signals (optional)
  initial begin
  
  $monitor("Time: %t | PC: %h | Reset: %b | Clock: %b | tinstr: %h | src1: %h | dest2: %h | outvalue1: %h | outvalue2: %h | writedata: %h | writeloc: %h | signExIn: %h | signExout: %h", 
    
        $time, uut.pc_current, uut.reset, uut.clk, uut.instruction, uut.src, uut.dest, uut.read_data1, uut.read_data2, uut.write_data, uut.write_reg, uut.imm_or_fn, uut.sign_ext_imm);
    $monitor("Timechecking ALU: %t | PC: %h | muxoutput: %h | ALUa: %h | ALUb: %h | ALUop: %h | Output: %h", 
    
        $time, uut.pc_current, uut.alu_src_mux_out, uut.read_data1, uut.alu_src_mux_out, uut.alu_op, uut.alu_result);
    $monitor ("Time: %t | ALUmuxreaddata2: %h | ALUmuxsignExtimm: %h | ALUmuxSel: %h | ALUmuxOut: %h", 
    
        $time, uut.read_data2, uut.sign_ext_imm, uut.alu_src, uut.alu_src_mux_out);
  end

endmodule
