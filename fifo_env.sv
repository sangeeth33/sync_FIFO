class fifo_env extends uvm_env;
  `uvm_component_utils(fifo_env)

  fifo_agent      agent;
  fifo_scoreboard scoreboard;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    agent = fifo_agent::type_id::create("agent", this);
    scoreboard = fifo_scoreboard::type_id::create("scoreboard", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    agent.monitor.ap.connect(scoreboard.monitor_imp);
  endfunction
endclass