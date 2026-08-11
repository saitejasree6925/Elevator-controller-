# Elevator-controller-
Elevator Controller

Description

A digital elevator controller designed using Verilog HDL to control a 4-floor elevator based on floor requests.

Features

- Supports 4 floors: 0, 1, 2, and 3
- Accepts floor requests
- Controls elevator movement UP and DOWN
- Stops automatically at the requested floor
- Provides door open indication
- Designed using a Finite State Machine (FSM)

Inputs

Signal| Width| Description
"clk"| 1 bit| System clock
"reset"| 1 bit| Resets elevator to floor 0
"request_floor"| 2 bits| Requested destination floor

Outputs

Signal| Width| Description
"current_floor"| 2 bits| Current elevator floor
"up"| 1 bit| Elevator moving upward
"down"| 1 bit| Elevator moving downward
"door_open"| 1 bit| Door open indication

Working

1. The elevator starts at floor 0.
2. A floor request is provided through "request_floor".
3. If the requested floor is higher than the current floor, the elevator moves UP.
4. If the requested floor is lower, the elevator moves DOWN.
5. When the elevator reaches the requested floor, it stops.
6. The "door_open" signal becomes HIGH when the elevator reaches the destination.
7. Reset returns the elevator to floor 0.

Simulation

The testbench applies different floor requests and monitors:

- Current floor
- UP movement
- DOWN movement
- Door status

The design can be simulated using Icarus Verilog, ModelSim, QuestaSim, or Vivado.

Expected Result

The elevator should correctly move between floors according to the requested destination and open the door when it reaches the requested floor.

Applications

- Residential elevators
- Office buildings
- Digital control systems
- FPGA-based elevator systems
- Verilog/FSM learning projects

Tools

- Verilog HDL
- Icarus Verilog / ModelSim / Vivado
- GTKWave for waveform visualization

Author

Digital Electronics Project – Elevator Controller
author:sai teja sree 
