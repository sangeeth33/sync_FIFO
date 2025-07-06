module test_top;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "fifo_if.sv"

  // DUT and Interface
  logic clk;
  fifo_if fifo_if_inst(clk);

  sync_fifo dut (
    .clk     (clk),
    .reset   (fifo_if_inst.reset),
    .wr_en   (fifo_if_inst.wr_en),
    .rd_en   (fifo_if_inst.rd_en),
    .din     (fifo_if_inst.din),
    .dout    (fifo_if_inst.dout),
    .full    (fifo_if_inst.full),
    .empty   (fifo_if_inst.empty)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    uvm_config_db#(virtual fifo_if)::set(null, "*", "vif", fifo_if_inst);
    run_test("fifo_base_test");
  end
endmodule