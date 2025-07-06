## 🧪 Sync FIFO Verification Testbench (UVM)

This repository contains a modular and scalable **Universal Verification Methodology (UVM)** testbench built to verify a **Synchronous FIFO** design in SystemVerilog.

### 📌 Key Components
- ✅ **FIFO DUT** – Configurable depth and width, supporting basic flags (`full`, `empty`)
- ✅ **UVM Testbench**:
  - Sequence Items, Sequences, Sequencer
  - Driver, Monitor, Agent, Scoreboard
  - Environment, Base Test, Test Top
- ✅ **SystemVerilog Interface** to connect DUT with UVM TB
- ✅ **Comprehensive Test Plan** covering 15 functional scenarios:
  - Overflow, Underflow, Wraparound, Latency, Data Integrity & more
- ✅ **Reusable UVM Sequences** (T01–T15) for targeted and randomized verification

### 🎯 Goals
- Validate FIFO ordering, flow control, and corner cases
- Achieve high functional coverage across all flags and access patterns
- Demonstrate robust UVM architecture suitable for IP-level integration

---
