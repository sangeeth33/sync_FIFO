class fifo_sequence_T12 extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence_T12)

  function new(string name = "fifo_sequence_T12");
    super.new(name);
  endfunction

  task body();
    fifo_seq_item req;

    // Fill FIFO to trigger 'full'
    repeat (16) begin
      req = fifo_seq_item::type_id::create("fill");
      req.wr_en = 1;
      req.rd_en = 0;
      req.data  = $urandom_range(0,255);
      start_item(req);
      finish_item(req);
    end

    // Optionally, wait and probe 'full' signal via interface

    // Drain FIFO to trigger 'empty'
    repeat (16) begin
      req = fifo_seq_item::type_id::create("drain");
      req.wr_en = 0;
      req.rd_en = 1;
      req.data  = 8'h00;
      start_item(req);
      finish_item(req);
    end

    // Probe 'empty' through monitor or assertions
  endtask
endclass