class fifo_seq_item extends uvm_sequence_item;
  rand bit        wr_en;
  rand bit        rd_en;
  rand bit [7:0]  data;

  `uvm_object_utils(fifo_seq_item)

  function new(string name = "fifo_seq_item");
    super.new(name);
  endfunction

  function void do_print();
    $display("wr_en=%0b, rd_en=%0b, data=%0h", wr_en, rd_en, data);
  endfunction
endclass