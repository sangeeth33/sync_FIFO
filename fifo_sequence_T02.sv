class fifo_sequence_T02 extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence_T02)

  function new(string name = "fifo_sequence_T02");
    super.new(name);
  endfunction

  task body();
    fifo_seq_item req;

    // Write first
    req = fifo_seq_item::type_id::create("req_write");
    req.wr_en = 1;
    req.rd_en = 0;
    req.data  = 8'hB2;
    start_item(req);
    finish_item(req);

    // Read next
    req = fifo_seq_item::type_id::create("req_read");
    req.wr_en = 0;
    req.rd_en = 1;
    req.data  = 8'h00; // Don't care
    start_item(req);
    finish_item(req);
  endtask
endclass