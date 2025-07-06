class fifo_sequence_T13 extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence_T13)

  function new(string name = "fifo_sequence_T13");
    super.new(name);
  endfunction

  task body();
    fifo_seq_item req;

    // Write pattern with timestamps in monitor
    req = fifo_seq_item::type_id::create("latency_write");
    req.wr_en = 1;
    req.rd_en = 0;
    req.data  = 8'hC3;
    start_item(req);
    finish_item(req);

    // Wait a few cycles to simulate delay
    repeat (5) @(posedge p_sequencer.vif.clk);

    req = fifo_seq_item::type_id::create("latency_read");
    req.wr_en = 0;
    req.rd_en = 1;
    req.data  = 8'h00;
    start_item(req);
    finish_item(req);
  endtask
endclass