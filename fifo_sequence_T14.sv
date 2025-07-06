class fifo_sequence_T14 extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence_T14)

  function new(string name = "fifo_sequence_T14");
    super.new(name);
  endfunction

  task body();
    fifo_seq_item req;

    repeat (20) begin
      // Write followed by read
      req = fifo_seq_item::type_id::create("data_check_write");
      req.wr_en = 1;
      req.rd_en = 0;
      req.data  = $urandom_range(0,255);
      start_item(req);
      finish_item(req);

      req = fifo_seq_item::type_id::create("data_check_read");
      req.wr_en = 0;
      req.rd_en = 1;
      req.data  = 8'h00;
      start_item(req);
      finish_item(req);
    end
  endtask
endclass