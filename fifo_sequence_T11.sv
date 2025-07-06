class fifo_sequence_T11 extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence_T11)

  function new(string name = "fifo_sequence_T11");
    super.new(name);
  endfunction

  task body();
    fifo_seq_item req;

    repeat (30) begin
      req = fifo_seq_item::type_id::create("req_random");
      assert(req.randomize() with {
        wr_en dist {1 := 50, 0 := 50};
        rd_en dist {1 := 50, 0 := 50};
        data  inside {[8'h00:8'hFF]};
      });
      start_item(req);
      finish_item(req);
    end
  endtask
endclass