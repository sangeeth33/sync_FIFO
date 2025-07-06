class fifo_sequence_T09 extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence_T09)

  function new(string name = "fifo_sequence_T09");
    super.new(name);
  endfunction

  task body();
    fifo_seq_item req;

    // Write a few items
    repeat (4) begin
      req = fifo_seq_item::type_id::create("pre_reset_write");
      req.wr_en = 1;
      req.rd_en = 0;
      req.data  = $urandom_range(0, 255);
      start_item(req);
      finish_item(req);
    end

    // Wait and assert reset externally (e.g., via a virtual interface task)
    // Example: vif.reset_fifo();

    #50; // Allow some time before reset — adjust as needed

    // Continue operations post-reset
    repeat (4) begin
      req = fifo_seq_item::type_id::create("post_reset_write");
      req.wr_en = 1;
      req.rd_en = 0;
      req.data  = $urandom_range(0, 255);
      start_item(req);
      finish_item(req);
    end

    repeat (4) begin
      req = fifo_seq_item::type_id::create("post_reset_read");
      req.wr_en = 0;
      req.rd_en = 1;
      req.data  = 8'h00;
      start_item(req);
      finish_item(req);
    end
  endtask
endclass