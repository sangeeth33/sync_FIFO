class fifo_sequence_T03 extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence_T03)

  function new(string name = "fifo_sequence_T03");
    super.new(name);
  endfunction

  task body();
    fifo_seq_item req;
    repeat (16) begin  // Assuming DEPTH = 16
      req = fifo_seq_item::type_id::create("req_fill");
      req.wr_en = 1;
      req.rd_en = 0;
      req.data  = $urandom_range(0, 255);
      start_item(req);
      finish_item(req);
    end
  endtask
endclass