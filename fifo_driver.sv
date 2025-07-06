class fifo_driver extends uvm_driver #(fifo_seq_item);
  `uvm_component_utils(fifo_driver)

  virtual fifo_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual fifo_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface not set")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      fifo_seq_item item;
      seq_item_port.get_next_item(item);

      vif.wr_en <= item.wr_en;
      vif.rd_en <= item.rd_en;
      vif.din   <= item.data;
      @(posedge vif.clk);
      seq_item_port.item_done();
    end
  endtask
endclass