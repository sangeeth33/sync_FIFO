class fifo_sequence_T15 extends uvm_sequence #(fifo_seq_item);
  `uvm_object_utils(fifo_sequence_T15)

  function new(string name = "fifo_sequence_T15");
    super.new(name);
  endfunction

  task body();
    fifo_seq_item req;

    // Continuous randomized burst traffic
    repeat (100) begin
      req = fifo_seq_item::type_id::create("stress_burst");
      assert(req.randomize() with {
        wr_en dist {1 := 60, 0 := 40};
        rd_en dist {1 := 60, 0 := 40};
        data inside {[0:255]};
      });
      start_item(req);
      finish_item(req);
    end
  endtask
endclass