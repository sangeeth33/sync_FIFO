class fifo_sequence_T05 extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence_T05)

  function new(string name = "fifo_sequence_T05");
    super.new(name);
  endfunction

  task body();
    fifo_seq_item req;
    repeat (10) begin
      req = fifo_seq_item::type_id::create("req_simul");
      req.wr_en = 1;
      req.rd_en = 1;
      req.data  = $urandom_range(0, 255);
      start_item(req);
      finish_item(req);
    end
  endtask
endclass