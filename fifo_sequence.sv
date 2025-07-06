class fifo_sequence extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence)

  function new(string name = "fifo_sequence");
    super.new(name);
  endfunction

  task body();
    repeat (20) begin
      fifo_seq_item req = fifo_seq_item::type_id::create("req");
      assert(req.randomize());
      start_item(req);
      finish_item(req);
    end
  endtask
endclass