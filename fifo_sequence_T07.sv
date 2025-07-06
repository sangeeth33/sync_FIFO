class fifo_sequence_T07 extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence_T07)

  function new(string name = "fifo_sequence_T07");
    super.new(name);
  endfunction

  task body();
    fifo_seq_item req;

    // Ensure FIFO is empty
    // Optional: reset DUT beforehand if needed

    // Try reading when empty
    repeat (3) begin
      req = fifo_seq_item::type_id::create("req_underflow");
      req.wr_en = 0;
      req.rd_en = 1;
      req.data  = 8'h00; // Don't care
      start_item(req);
      finish_item(req);
    end

    // Now write valid data
    req = fifo_seq_item::type_id::create("req_write");
    req.wr_en = 1;
    req.rd_en = 0;
    req.data  = 8'h5A;
    start_item(req);
    finish_item(req);

    // Then read it correctly
    req = fifo_seq_item::type_id::create("req_read");
    req.wr_en = 0;
    req.rd_en = 1;
    req.data  = 8'h00;
    start_item(req);
    finish_item(req);
  endtask
endclass