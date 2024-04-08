# Quartus HLS with Python2Verilog

## Environment
- Windows 10
- Quartus Prime 19.1 (Lite Edition) 
- WSL 1 on Ubuntu 22.04
- Folder in Windows partition with WSL 1 running Python 3.10
- DE1-SoC Board

## Steps
1. Create a virtual Python env
    1. `python3 -m venv venv`
    1. `source venv/bin/activate`
    1. `pip install python2verilog typing_extensions`
    1. `python3 python_src/fib.py` to generate `python_src/fib.sv`
1. Create a new project in Quartus with `lab3_top` as the top-level module
1. Set the pin assignments to `verilog_src/DE1_SoC.qsf`
1. Add the following files to the project
    1. `verilog_src/lab3_top.v`
    1. `python_src/fib.sv`
1. Compile and upload to DE1-SoC board
1. Hold both KEY0 and KEY3 at the same time, let both go to reset
1. Tap KEY3 multiple times to see Fib sequence

## Update
- After updating `python/fib.py`, re-run `python3 python_src/fib.py` to update `python_src/fib.sv`