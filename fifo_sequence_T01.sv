class fifo_sequence_T01 extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence_T01)

  function new(string name = "fifo_sequence_T01");
    super.new(name);
  endfunction

  task body();
    fifo_seq_item req;
    req = fifo_seq_item::type_id::create("req");
    req.wr_en = 1;
    req.rd_en = 0;
    req.data  = 8'hA1;
    start_item(req);
    finish_item(req);
  endtask
endclass