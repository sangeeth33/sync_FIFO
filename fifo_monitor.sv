class fifo_monitor extends uvm_monitor;
  `uvm_component_utils(fifo_monitor)

  virtual fifo_if vif;
  uvm_analysis_port #(fifo_seq_item) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual fifo_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface not set")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      if (vif.wr_en || vif.rd_en) begin
        fifo_seq_item item = fifo_seq_item::type_id::create("item");
        item.wr_en = vif.wr_en;
        item.rd_en = vif.rd_en;
        item.data  = vif.din;
        ap.write(item);
      end
    end
  endtask
endclass