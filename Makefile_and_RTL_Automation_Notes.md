# Makefile & RTL Automation

> **Purpose:** Learn how to automate Verilog compilation, simulation,
> waveform viewing, linting, and cleanup using a single master Makefile.

------------------------------------------------------------------------

## 1. Why Do We Need a Makefile?

During Verilog/RTL development, we repeatedly perform the same sequence:

``` text
RTL + Testbench
      ↓
   Compile
      ↓
  Simulate
      ↓
 Generate VCD
      ↓
  GTKWave
```

Without automation, we repeatedly type commands such as:

``` bash
iverilog -o sim.out design.v tb_design.v
vvp sim.out
gtkwave dump.vcd
```

This becomes inefficient as the number of RTL projects increases.

A **Makefile** lets us define these workflows once and execute them with
short commands such as:

``` bash
make run PROJECT=Decoder_2to4
```

### Main benefit

> **Makefile = repeatable command-line automation.**

It does not replace Verilog, Icarus Verilog, GTKWave, or Linux. It
coordinates them.

------------------------------------------------------------------------

# 2. What Is `make`?

`make` is a build automation tool.

It reads instructions from a file normally named:

``` text
Makefile
```

A Makefile contains **targets** and the commands associated with those
targets.

Basic syntax:

``` makefile
target:
    command
```

Example:

``` makefile
hello:
    echo "Makefile is working!"
```

Run:

``` bash
make hello
```

Output:

``` text
Makefile is working!
```

------------------------------------------------------------------------

# 3. The Basic Makefile Mental Model

Think of a Makefile like this:

``` text
make <target>
      ↓
Find target in Makefile
      ↓
Execute its commands
```

For example:

``` bash
make clean
```

means:

``` text
Find the "clean" target
        ↓
Execute commands under "clean"
```

------------------------------------------------------------------------

# 4. Targets

A **target** is a named operation.

Example:

``` makefile
compile:
    iverilog ...
```

The target is:

``` text
compile
```

Run it using:

``` bash
make compile
```

Another example:

``` makefile
clean:
    rm -f sim.out
```

Run:

``` bash
make clean
```

### Important

A target does not have to create a physical file. It can represent an
action.

For example:

``` makefile
wave:
    gtkwave dump.vcd
```

`wave` is simply a command/workflow name.

------------------------------------------------------------------------

# 5. TAB vs Spaces --- Very Important

Commands under a target must begin with a **TAB**.

Correct:

``` makefile
hello:
    echo "Hello"
```

Incorrect:

``` makefile
hello:
        echo "Hello"
```

If spaces are used instead of a TAB, Make can report:

``` text
*** missing separator (did you mean TAB instead of 8 spaces?).
```

### Debugging indentation

Use:

``` bash
cat -A Makefile
```

A real TAB appears as:

``` text
^I
```

Example:

``` text
hello:
^Iecho "Hello"
```

------------------------------------------------------------------------

# 6. Creating and Editing a Makefile

Create/open it with:

``` bash
nano Makefile
```

Save in Nano:

``` text
Ctrl + O
Enter
Ctrl + X
```

Check the file:

``` bash
cat Makefile
```

------------------------------------------------------------------------

# 7. Current Repository

Our master Makefile is located at:

``` text
~/vlsi_workspace/verilog_Learning/Makefile
```

The repository contains areas such as:

``` text
verilog_Learning/
├── Makefile
├── README.md
├── RTL_Design/
└── Verilog_Basics/
```

The Makefile searches these directories:

``` makefile
SEARCH_DIRS = RTL_Design Verilog_Basics
```

------------------------------------------------------------------------

# 8. Current Working Directory

By default, `make` looks for `Makefile` in the **current working
directory**.

Example:

``` bash
cd ~/vlsi_workspace/verilog_Learning
make list
```

works because the Makefile is there.

If you move somewhere else:

``` bash
cd ~
make list
```

Make does not automatically walk into:

``` text
~/vlsi_workspace/verilog_Learning/
```

to find the Makefile.

For our current workflow, use:

``` bash
cd ~/vlsi_workspace/verilog_Learning
```

before running Make commands.

------------------------------------------------------------------------

# 9. Makefile Variables

Variables prevent us from repeatedly writing long paths.

Example:

``` makefile
PROJECT_DIR = RTL_Design/Combinational/Encoder/Priority_Encoder_4to2
RTL = $(PROJECT_DIR)/pri_enc_4to2.v
TB  = $(PROJECT_DIR)/tb_pri_enc_4to2.v
OUT = $(PROJECT_DIR)/sim.out
VCD = $(PROJECT_DIR)/dump.vcd
```

Here:

``` text
PROJECT_DIR
RTL
TB
OUT
VCD
```

are Make variables.

Use a variable with:

``` makefile
$(VARIABLE_NAME)
```

For example:

``` makefile
$(PROJECT_DIR)/pri_enc_4to2.v
```

expands to:

``` text
RTL_Design/Combinational/Encoder/Priority_Encoder_4to2/pri_enc_4to2.v
```

------------------------------------------------------------------------

# 10. Make Variables vs Bash Variables

This distinction is important.

Inside a Makefile:

``` makefile
PROJECT_DIR = RTL_Design/...
```

and:

``` makefile
$(PROJECT_DIR)
```

are Make syntax.

Do not assume Bash knows about Make variables.

For example, typing this directly in Bash:

``` bash
cd $(PROJECT_DIR)
```

does **not** use the Makefile variable.

Make expands:

``` text
$(PROJECT_DIR)
```

when the command is executed through:

``` bash
make ...
```

------------------------------------------------------------------------

# 11. Verilog Simulation Flow

The tools work together like this:

``` text
             RTL + Testbench
                    │
                    ▼
               iverilog
                    │
                    ▼
                 sim.out
                    │
                    ▼
                   vvp
                    │
                    ▼
               Simulation
                    │
                    ▼
                 dump.vcd
                    │
                    ▼
                GTKWave
```

------------------------------------------------------------------------

# 12. Icarus Verilog --- `iverilog`

`iverilog` compiles Verilog source files.

Example:

``` bash
iverilog -o sim.out design.v tb_design.v
```

Here:

``` text
iverilog
    ↓
Verilog compiler

-o sim.out
    ↓
Name the compiled simulation output sim.out

design.v
    ↓
RTL

tb_design.v
    ↓
Testbench
```

Compilation alone does not mean the simulation has run.

------------------------------------------------------------------------

# 13. Running the Simulation --- `vvp`

After compilation:

``` bash
vvp sim.out
```

This executes the compiled simulation.

Typical flow:

``` bash
iverilog -o sim.out design.v tb_design.v
vvp sim.out
```

------------------------------------------------------------------------

# 14. GTKWave

GTKWave is used to inspect simulation waveforms.

If the testbench creates:

``` text
dump.vcd
```

open it with:

``` bash
gtkwave dump.vcd
```

A typical automated workflow is:

``` bash
iverilog ...
vvp sim.out
gtkwave dump.vcd &
```

------------------------------------------------------------------------

# 15. `$dumpfile()` and VCD Location

A typical Verilog testbench contains:

``` verilog
$dumpfile("dump.vcd");
$dumpvars(0, tb_module);
```

The filename:

``` text
dump.vcd
```

is relative.

The VCD is therefore created in the simulator's **current working
directory**.

For example, if simulation runs from:

``` text
~/vlsi_workspace/verilog_Learning
```

then:

``` verilog
$dumpfile("dump.vcd");
```

creates:

``` text
~/vlsi_workspace/verilog_Learning/dump.vcd
```

------------------------------------------------------------------------

# 16. Why We Use `cd` Before `vvp`

We want generated files to stay inside their project directory.

For example:

``` text
Priority_Encoder_4to2/
├── pri_enc_4to2.v
├── tb_pri_enc_4to2.v
├── sim.out
└── dump.vcd
```

Therefore the Makefile can use:

``` makefile
cd $(PROJECT_DIR) && vvp sim.out
```

This means:

1.  Change into the project directory.
2.  If that succeeds, run `vvp sim.out`.

Then:

``` verilog
$dumpfile("dump.vcd");
```

creates `dump.vcd` in that project directory.

------------------------------------------------------------------------

# 17. The `&&` Operator

In shell commands:

``` bash
command1 && command2
```

means:

> Run `command2` only if `command1` succeeds.

Example:

``` bash
cd project && vvp sim.out
```

Conceptually:

``` text
cd project
    │
    ├── success → vvp sim.out
    │
    └── failure → stop
```

This is useful in Makefiles.

------------------------------------------------------------------------

# 18. The `&` Operator

In:

``` bash
gtkwave dump.vcd &
```

the `&` runs GTKWave in the background.

Without `&`:

``` bash
gtkwave dump.vcd
```

the shell waits for GTKWave.

With `&`:

``` bash
gtkwave dump.vcd &
```

the GUI runs in the background and the terminal remains available.

------------------------------------------------------------------------

# 19. Cleaning Generated Files

Source files should remain under version control.

Examples of source files:

``` text
design.v
tb_design.v
```

Generated files include:

``` text
sim.out
dump.vcd
```

These can be removed safely when no longer needed.

Example:

``` makefile
clean:
    rm -f sim.out
    rm -f dump.vcd
```

Then:

``` bash
make clean
```

------------------------------------------------------------------------

# 20. Why We Don't Manually Create One Target Per Project

A repository may contain many projects:

``` text
MUX
DEMUX
Encoder
Decoder
Comparator
Adder
...
```

A naive Makefile would require:

``` makefile
mux_2to1:
    ...

mux_4to1:
    ...

mux_8to1:
    ...

decoder_2to4:
    ...

decoder_6to64:
    ...
```

This becomes repetitive and difficult to maintain.

Instead, our master Makefile uses automatic project discovery.

------------------------------------------------------------------------

# 21. Automatic Project Discovery

Our Makefile searches:

``` makefile
SEARCH_DIRS = RTL_Design Verilog_Basics
```

Then a command such as:

``` bash
make run PROJECT=Decoder_2to4
```

causes the Makefile to search for the project directory.

It then attempts to find:

``` text
RTL source
Testbench
```

and automatically performs compilation and simulation.

------------------------------------------------------------------------

# 22. Current Automatic Workflow

The main command is:

``` bash
make run PROJECT=<project-name>
```

The workflow is approximately:

``` text
                 PROJECT NAME
                      │
                      ▼
             Find project directory
                      │
                      ▼
                  Find RTL
                      │
                      ▼
               Find testbench
                      │
                      ▼
                  iverilog
                      │
                      ▼
                  sim.out
                      │
                      ▼
             cd into project
                      │
                      ▼
                    vvp
                      │
                      ▼
                  dump.vcd
                      │
                      ▼
                  GTKWave
```

------------------------------------------------------------------------

# 23. `make list`

Use:

``` bash
make list
```

This searches the repository and lists discoverable projects.

This is useful when you don't remember the exact project directory name.

------------------------------------------------------------------------

# 24. `make run`

Example:

``` bash
make run PROJECT=Decoder_2to4
```

This is the main all-in-one command.

It attempts to:

``` text
Find project
    ↓
Find RTL
    ↓
Find testbench
    ↓
Compile
    ↓
Simulate
    ↓
Open GTKWave
```

Another example:

``` bash
make run PROJECT=Priority_Encoder_4to2
```

------------------------------------------------------------------------

# 25. `make compile`

Compile only:

``` bash
make compile PROJECT=Decoder_2to4
```

This creates:

``` text
sim.out
```

but does not run the simulation or open GTKWave.

Useful when debugging compilation errors.

------------------------------------------------------------------------

# 26. `make sim`

Run an already compiled simulation:

``` bash
make sim PROJECT=Decoder_2to4
```

This expects:

``` text
sim.out
```

to already exist.

Typical workflow:

``` bash
make compile PROJECT=Decoder_2to4
make sim PROJECT=Decoder_2to4
```

------------------------------------------------------------------------

# 27. `make wave`

Open an existing waveform:

``` bash
make wave PROJECT=Decoder_2to4
```

This expects:

``` text
dump.vcd
```

to already exist.

Useful when you want to inspect a waveform again without rerunning the
simulation.

------------------------------------------------------------------------

# 28. `make lint`

Verilator can perform static linting.

Example:

``` bash
make lint PROJECT=Priority_Encoder_4to2
```

Linting can detect issues such as:

-   syntax problems
-   suspicious constructs
-   width mismatches
-   unused signals
-   coding problems

This command requires Verilator to be installed.

------------------------------------------------------------------------

# 29. `make clean`

Run:

``` bash
make clean
```

This removes generated simulation artifacts throughout the repository,
such as:

``` text
sim.out
dump.vcd
sim.oout
```

It should not remove your RTL or testbench source files.

------------------------------------------------------------------------

# 30. `make clean-all`

Run:

``` bash
make clean-all
```

This performs a more aggressive cleanup of supported generated files,
including things such as:

``` text
sim.out
dump.vcd
sim.oout
*.log
*.vvp
```

Use it when you want to clean generated simulation artifacts broadly.

------------------------------------------------------------------------

# 31. `make help`

Run:

``` bash
make help
```

This displays the available commands and their purpose.

Useful when you forget the Makefile interface.

------------------------------------------------------------------------

# 32. `.PHONY`

Our Makefile ends with:

``` makefile
.PHONY: help list run compile sim wave lint clean clean-all hello
```

`.PHONY` tells Make that these names represent **actions**, not actual
files.

For example:

``` makefile
clean:
    rm -f ...
```

If a file named:

``` text
clean
```

happened to exist, Make could otherwise treat the target differently.

Declaring it phony avoids that problem.

------------------------------------------------------------------------

# 33. Important Linux Commands Used

### Show current directory

``` bash
pwd
```

### List files

``` bash
ls
```

### List detailed files

``` bash
ls -l
```

### Search files

``` bash
find RTL_Design -type f
```

### Search directories

``` bash
find RTL_Design -type d
```

### Display a file

``` bash
cat Makefile
```

### Show hidden characters

``` bash
cat -A Makefile
```

### Edit a file

``` bash
nano Makefile
```

### Remove a file

``` bash
rm -f sim.out
```

------------------------------------------------------------------------

# 34. Debugging a Makefile

When something fails, don't immediately rewrite everything.

Use:

``` bash
cat Makefile
```

to inspect the Makefile.

Use:

``` bash
cat -A Makefile
```

to check TABs.

Use:

``` bash
make <target>
```

to see exactly what command Make executes.

For example:

``` bash
make run PROJECT=Decoder_2to4
```

The printed commands help identify whether the problem is:

``` text
Make
Linux path
Icarus
Testbench
VCD
GTKWave
```

------------------------------------------------------------------------

# 35. Repository Conventions Matter

Automatic Makefiles work best when projects follow consistent naming
conventions.

Our current automation assumes a structure roughly like:

``` text
Project/
├── RTL.v
└── tb_RTL.v
```

For example:

``` text
Decoder_2to4/
├── Decoder_2to4.v
└── tb_Decoder_2to4.v
```

The Makefile searches for:

``` text
main RTL .v
tb_*.v
```

------------------------------------------------------------------------

# 36. Current Repository Exceptions

Some projects may not follow exactly the same structure.

For example:

``` text
Encoder_4to2/
├── encoder_4to2.v
├── tb_encoder_4to2.v
└── checker.v
```

Another project might contain:

``` text
Project/
├── module1.v
├── module2.v
└── tb_project.v
```

Multiple RTL files or multiple testbenches require more sophisticated
handling.

Therefore:

> **Automatic discovery is powerful, but it is not magic.**

The repository structure must provide enough information for the
automation to know what should be compiled and tested.

------------------------------------------------------------------------

# 37. Why We Ignore Generated Files

Generated files such as:

``` text
sim.out
dump.vcd
```

are outputs of the simulation process.

They are not normally the source of truth.

The important files are:

``` text
RTL
Testbench
Makefile
Documentation
```

Generated artifacts can usually be recreated by running the Makefile.

This is an important software/RTL engineering principle:

> **Prefer reproducible generation over manually preserving build
> artifacts.**

------------------------------------------------------------------------

# 38. Makefile and Git

The Makefile itself is a source file and should normally be committed to
Git.

For example:

``` bash
git status
```

Then:

``` bash
git add Makefile
git commit -m "Add master Makefile"
git push
```

Generated files such as:

``` text
sim.out
dump.vcd
```

normally should not be committed.

A `.gitignore` file can later be used to prevent accidental commits of
generated artifacts.

------------------------------------------------------------------------

# 39. Makefile in a Real RTL Workflow

Make can become the command-line interface to an RTL project.

A larger workflow can look like:

``` text
             RTL
              │
      ┌───────┼────────┐
      ▼       ▼        ▼
    Sim     Lint     Synthesis
      │       │        │
      ▼       ▼        ▼
   VCD      Reports   Netlist
      │
      ▼
  GTKWave
```

Possible commands:

``` bash
make sim
make lint
make synth
make sta
```

The exact tools can change, but the automation concept remains the same.

------------------------------------------------------------------------

# 40. Connection to ASIC/RTL Engineering

Makefile knowledge is not itself RTL design.

However, it becomes valuable because real RTL projects require
repeatable workflows.

A professional flow often involves:

``` text
Specification
      ↓
RTL
      ↓
Simulation
      ↓
Lint
      ↓
Verification
      ↓
Synthesis
      ↓
STA
      ↓
Physical Design
```

Automation helps make these stages:

-   repeatable
-   scriptable
-   reproducible
-   easier to run in CI
-   less dependent on manual commands

------------------------------------------------------------------------

# 41. The Current Master Makefile Interface

For your learning repository, the important commands are:

``` bash
make help
```

Show available commands.

``` bash
make list
```

List projects.

``` bash
make run PROJECT=<project>
```

Compile + simulate + GTKWave.

``` bash
make compile PROJECT=<project>
```

Compile only.

``` bash
make sim PROJECT=<project>
```

Run compiled simulation.

``` bash
make wave PROJECT=<project>
```

Open existing waveform.

``` bash
make lint PROJECT=<project>
```

Run Verilator lint.

``` bash
make clean
```

Remove generated simulation files.

``` bash
make clean-all
```

Remove generated simulation artifacts more broadly.

------------------------------------------------------------------------

# 42. Quick Reference

## Edit Makefile

``` bash
nano Makefile
```

## Test Makefile

``` bash
make hello
```

## List projects

``` bash
make list
```

## Run project

``` bash
make run PROJECT=Decoder_2to4
```

## Compile only

``` bash
make compile PROJECT=Decoder_2to4
```

## Simulate

``` bash
make sim PROJECT=Decoder_2to4
```

## Open waveform

``` bash
make wave PROJECT=Decoder_2to4
```

## Lint

``` bash
make lint PROJECT=Decoder_2to4
```

## Clean

``` bash
make clean
```

## Full cleanup

``` bash
make clean-all
```

------------------------------------------------------------------------

# 43. Core Concepts to Remember

Do not memorize the entire Makefile.

Understand these concepts:

``` text
TARGET
  ↓
What operation do I want?

VARIABLE
  ↓
What value/path do I want to reuse?

COMMAND
  ↓
What Linux/tool command performs it?

TAB
  ↓
Required before Make commands

make
  ↓
Execute the target

iverilog
  ↓
Compile Verilog

vvp
  ↓
Run compiled simulation

GTKWave
  ↓
Inspect waveform

clean
  ↓
Remove generated artifacts
```

------------------------------------------------------------------------

# 44. Final Mental Model

The most important thing to understand is this:

``` text
                  Makefile
                     │
          ┌──────────┼──────────┐
          ▼          ▼          ▼
       Compile     Simulate    Lint
          │          │          │
       iverilog     vvp      Verilator
                     │
                     ▼
                  dump.vcd
                     │
                     ▼
                  GTKWave
```

And the command you will use most often is:

``` bash
make run PROJECT=<project>
```

The Makefile is therefore your **automation layer around the RTL
development tools**.

------------------------------------------------------------------------

# 45. What Comes Next

Makefile automation is now sufficient for the current Verilog learning
stage.

The next major RTL concepts should return to the actual hardware:

``` text
Combinational RTL
      ↓
Adders / Subtractors
      ↓
Comparators
      ↓
ALU
      ↓
Sequential RTL
      ↓
Flip-Flops
      ↓
Registers
      ↓
Counters
      ↓
FSMs
```

The important lesson is:

> **Do not confuse automation with RTL design. Make helps you run the
> RTL workflow; Verilog/SystemVerilog is what describes the hardware.**
