# 🚀 Verilog Fundamentals

[![Language](https://img.shields.io/badge/Language-Verilog-24b495.svg)](https://en.wikipedia.org/wiki/Verilog)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg)](CONTRIBUTING.md)

A comprehensive collection of Verilog HDL implementations ranging from basic logic gates to complex sequential circuits. This repository is designed as a learning resource and a foundation for digital logic design.

---

## 👨‍💻 About This Repository

This repository documents my journey in learning **Verilog for VLSI / Chip Design (RTL)**.

It focuses on:

* Building strong fundamentals
* Writing clean RTL code
* Understanding simulation workflow
* Developing real engineering skills (not just theory)

---

## 🎯 Objectives

* Learn Verilog from **basic to intermediate level**
* Understand **hardware thinking (parallel execution)**
* Implement **digital circuits using RTL**
* Practice **testbench and waveform debugging**
* Build a **strong GitHub portfolio for VLSI**

---

## 🧠 Key Concepts Covered

* Verilog syntax & module structure
* Dataflow modeling (`assign`)
* Behavioral modeling (`always`)
* Combinational circuits
* Sequential circuits *(upcoming)*
* Testbench design
* Simulation & waveform analysis

---

## 🗂️ Project Structure

```
Verilog-Fundamentals/
│
├── Verilog_Basics/
│
│   ├── Gates/
│   │   ├── and_gate/
│   │   │   ├── and_gate.v
│   │   │   ├── tb_and_gate.v
│   │   │   └── dump.vcd
│   │   │
│   │   ├── or_gate/
│   │   ├── xor_gate/
│   │   └── xnor_gate/
│
│   ├── Combinational/
│   │   ├── mux_2to1/
│   │   │   ├── mux_2to1.v
│   │   │   ├── tb_mux_2to1.v
│   │   │   └── dump.vcd
│   │   │
│   │   ├── full_adder/
│   │   └── decoder_2to4/
│
│   └── Sequential/
│       ├── d_flip_flop/
│       │   ├── d_ff.v
│       │   ├── tb_d_ff.v
│       │   └── dump.vcd
│       │
│       ├── jk_flip_flop/
│       └── counter/
│
└── README.md
```

---

## ⚙️ Tools & Environment

* 🐧 WSL (Linux)
* 💻 VS Code
* 🔧 Icarus Verilog (`iverilog`)
* ▶️ vvp (simulation runtime)
* 📊 GTKWave (waveform viewer)

---

## 🔄 Simulation Workflow

```bash
iverilog -o sim.out design.v tb.v   # Compile
vvp sim.out                         # Run simulation
gtkwave dump.vcd                    # View waveform
```

---

## 🧪 Completed Projects

### ✔ AND Gate

* Verilog implementation
* Testbench created
* Simulation verified

### ✔ OR Gate

* Verilog implementation
* Testbench written
* Waveform verified

---

## 🔜 Upcoming Projects

* Multiplexer (MUX)
* Decoder
* Flip-Flops
* FSM (Finite State Machine)
* ALU
* UART

---

## 🧠 Learning Approach

This repository follows:

> **Learn → Implement → Simulate → Debug → Improve**

---

## 📈 Roadmap

| Stage        | Topics                   |
| ------------ | ------------------------ |
| Beginner     | Gates, MUX, Decoder      |
| Intermediate | FSM, Counters, Registers |
| Advanced     | ALU, UART, CPU           |

---

## 📌 Key Learnings

* Verilog is **not programming — it's hardware description**
* Parallel execution is core concept
* Testbench is as important as design
* Waveform debugging is critical skill

---

## 🚀 Future Goals

* Build complete **RTL projects**
* Implement **RISC-V based CPU**
* Learn **SystemVerilog & Verification (UVM)**

---

## 🤝 Contributions

This is a personal learning repository, but suggestions and improvements are always welcome.

---

## ⭐ Support

If you find this helpful:

* ⭐ Star this repository
* 🍴 Fork it
* 📢 Share with others

---

## 📬 Connect With Me

* GitHub: https://github.com/CodeWithOmsai77

---

## ⚡ Final Note

> “Real learning happens when you debug your own mistakes.”

<p align="center"> <img src="https://capsule-render.vercel.app/api?type=waving&color=11998e&height=80&section=footer&fontSize=16&fontColor=0f2027"/> </p>
