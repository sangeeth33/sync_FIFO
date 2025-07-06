class fifo_scoreboard extends uvm_component;
  `uvm_component_utils(fifo_scoreboard)

  uvm_analysis_imp #(fifo_seq_item, fifo_scoreboard) monitor_imp;
  fifo_seq_item expected_data[$];

  function new(string name, uvm_component parent);
    super.new(name, parent);
    monitor_imp = new("monitor_imp", this);
  endfunction

  function void write(fifo_seq_item item);
    if (item.wr_en)
      expected_data.push_back(item);
    if (item.rd_en) begin
      if (expected_data.size() > 0) begin
        fifo_seq_item exp = expected_data.pop_front();
        if (item.data !== exp.data)
          `uvm_error("MISMATCH", $sformatf("Expected %0h, got %0h", exp.data, item.data))
      end
    end
  endfunction
endclass