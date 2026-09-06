# Verilog RTL Design & Verification Fundamentals

[![Simulation: Icarus Verilog](https://img.shields.io/badge/Simulator-Icarus--Verilog-blue.svg)](http://iverilog.icarus.com/)
[![Waveform: GTKWave](https://img.shields.io/badge/Waveform-GTKWave-orange.svg)](http://gtkwave.sourceforge.net/)
[![Language: Verilog-2001](https://img.shields.io/badge/Language-Verilog--2001-green.svg)]()
[![Target: RTL & ASIC/FPGA](https://img.shields.io/badge/Domain-Digital--VLSI-red.svg)]()

A structured repository tracking the design, implementation, and cycle-accurate functional verification of digital logic circuits using Verilog HDL. Built and simulated on Linux (WSL) using open-source EDA tools.

---

## 📌 Architecture & Design Taxonomy

```text
RTL_Design/
├── Combinational/
│   ├── Gates/                   # Primitive logic (AND, NAND, NOR, XOR, XNOR)
│   ├── Decoders/                # 2-to-4, parameterized 6-to-64 decoders
│   ├── Encoders/                # Standard & 4:2 / 8:3 Priority Encoders with valid flags
│   ├── Multiplexers/            # 2:1 up to 16:1 MUX (Behavioral & Hierarchical 4:1 trees)
│   └── Demultiplexers/          # 1:2 up to 1:16 DeMUX tree architectures
└── Sequential/ (In Progress)    # Flip-flops, Synchronous Counters, Shift Registers, FSMs---
```
## ⚡ Final Note
> “Real learning happens when you debug your own mistakes.”

<p align="center"> <img src="https://capsule-render.vercel.app/api?type=waving&color=11998e&height=80&section=footer&fontSize=16&fontColor=0f2027"/> </p>
