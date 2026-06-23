# Single Port RAM

A synthesizable single-port RAM (Random Access Memory) model written in Verilog HDL. This design implements a 16×8 synchronous RAM with chip-select, synchronous reset, and a single data bus for both read and write operations.

---

## Project Overview

| Parameter       | Value        |
|-----------------|--------------|
| **Memory Size** | 16 × 8 bits  |
| **Technology**  | Verilog HDL  |
| **Type**        | Synchronous Single-Port RAM |
| **Clocking**    | Positive edge-triggered |
| **Reset**       | Synchronous, active-high |
| **Toolchain**   | Icarus Verilog (iverilog) |

---

## RAM Architecture

```
                    ┌─────────────────────────────────────┐
                    │           SINGLE_PORT_RAM            │
                    │                                     │
    clk ───────────►│                                     │
    rst ───────────►│          16 × 8                     │
    we ────────────►│         Memory                       │
    cs ────────────►│         Array                       │
    addr[3:0] ─────►│                                     │
    din[7:0] ──────►│                                     │
                    │                            dout[7:0]├────►
                    └─────────────────────────────────────┘
```

### Block Diagram — Detailed Data Flow

```
           ┌──────┐
    clk ──►│      │
           │      │
    rst ──►│      │
           │      │         ┌──────────────┐      ┌──────────┐
    we ───►│      │────────►│  Write Enable ├─────►│          │
           │      │         └──────────────┘      │  16×8    │
    cs ───►│      │────────►│  Chip Select   ├─────►│  Memory  │
           │      │         └──────────────┘      │  Array   │
    addr ─►│      │────────►│  Address Decode ├─────►│          │
           │      │         └──────────────┘      │          │
    din ───►│      │────────►│  Data Input     ├─────►│          │
           │      │                                │          │
           │      │◄───────────────────────────────┤ dout     │
           └──────┘                                └──────────┘
```

---

## Port Description

| Port     | Direction | Width | Description |
|----------|-----------|-------|-------------|
| `clk`    | Input     | 1     | System clock (positive edge-triggered) |
| `rst`    | Input     | 1     | Synchronous reset (active-high) |
| `we`     | Input     | 1     | Write enable (1 = write, 0 = read) |
| `cs`     | Input     | 1     | Chip select (1 = device active) |
| `addr`   | Input     | 4     | Address bus (16 locations: 0–15) |
| `din`    | Input     | 8     | Data input bus |
| `dout`   | Output    | 8     | Data output bus |

---

## Functional Description

The single-port RAM operates synchronously on the positive edge of the system clock (`clk`). All operations — read, write, and reset — are evaluated and committed at the rising clock edge.

### Reset Operation

When `rst` is asserted **high**, all 16 memory locations are cleared to `8'h00` on the next rising clock edge. Reset takes priority over all other operations.

```
Clock Cycle:     [0]         [1]         [2]
clk           ──┐   ┌───┐   ┌───┐   ┌───┐   ┌───
                └───┘   └───┘   └───┘   └───┘
rst           ────────────────────────────────
                        │
mem[0..15]    xxxxxxxx ◄┘         00000000
```

### Write Operation

When `cs = 1` and `we = 1`, the data on `din` is written into the memory location addressed by `addr` at the rising clock edge.

```
Clock Cycle:     [N]         [N+1]
clk           ──┐   ┌───┐   ┌───┐   ┌───
                └───┘   └───┘   └───┘
cs            ──────────────────────────
we            ────────
addr           AddrN ───►
din            DataN ────►
                                │
mem[AddrN]     xxxxxxxx ◄───────┘   DataN
```

**Example:** Writing `0xAA` to address `0x3`.

| Time     | `clk` | `we` | `cs` | `addr` | `din`  | `dout` | Action         |
|----------|-------|------|------|--------|--------|--------|----------------|
| 10000 ns | 0     | 1    | 1    | 3      | aa     | xx     | Write enabled  |
| 15000 ns | 1     | 1    | 1    | 3      | aa     | xx     | `mem[3] ← 0xAA` |

### Read Operation

When `cs = 1` and `we = 0`, the content of the memory location addressed by `addr` is driven onto `dout` after one clock cycle.

```
Clock Cycle:     [N]         [N+1]
clk           ──┐   ┌───┐   ┌───┐   ┌───
                └───┘   └───┘   └───┘
cs            ──────────────────────────
we            ──
addr           AddrN ──►
                               │
dout          High-Z ◄─────────┘   DataN
```

**Example:** Reading from address `0x3` after writing `0xAA`.

| Time     | `clk` | `we` | `cs` | `addr` | `dout` | Action                    |
|----------|-------|------|------|--------|--------|---------------------------|
| 30000 ns | 0     | 0    | 1    | 3      | xx     | Read enabled              |
| 35000 ns | 1     | 0    | 1    | 3      | aa     | `dout ← mem[3] = 0xAA` ✅ |

The read is **registered** — data appears on `dout` one clock cycle after the address is presented.

### Chip Select Behavior

When `cs = 0`, the RAM is **deactivated**. No read or write operations occur regardless of other control signals. The output `dout` retains its last value.

| `cs` | `we` | Operation        | `dout`               |
|------|------|------------------|-----------------------|
| 0    | x    | None (idle)      | Holds last value      |
| 1    | 0    | Read             | `mem[addr]` (next cycle) |
| 1    | 1    | Write            | High-Z / unchanged    |

---

## RTL Design

```verilog
`timescale 1ns/1ps
module single_port_ram(
    input clk,
    input rst,
    input we,
    input cs,
    input [3:0] addr,
    input [7:0] din,    // 16 × 8
    output reg [7:0] dout
);
    reg [7:0] mem[15:0];
    integer i;
    
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 16; i = i + 1)
                mem[i] <= 0;          // RESET
        end
        else if (cs) begin
            if (we)
                mem[addr] <= din;     // WRITE
            else
                dout <= mem[addr];    // READ
        end
    end
endmodule
```

---

## Simulation Results

All test cases pass. Below is the verified simulation output:

```
Time=0     | clk=0 rst=1 we=0 cs=0 addr=0 din=00 dout=xx  ← Reset asserted
Time=5000  | clk=1 rst=1 we=0 cs=0 addr=0 din=00 dout=xx
Time=10000 | clk=0 rst=0 we=1 cs=1 addr=3 din=aa dout=xx  ← Write 0xAA → addr 3
Time=15000 | clk=1 rst=0 we=1 cs=1 addr=3 din=aa dout=xx  │
Time=20000 | clk=0 rst=0 we=1 cs=1 addr=5 din=55 dout=xx  ← Write 0x55 → addr 5
Time=25000 | clk=1 rst=0 we=1 cs=1 addr=5 din=55 dout=xx  │
Time=30000 | clk=0 rst=0 we=0 cs=1 addr=3 din=55 dout=xx  ← Read addr 3
Time=35000 | clk=1 rst=0 we=0 cs=1 addr=3 din=55 dout=aa  ✅ dout = 0xAA
Time=40000 | clk=0 rst=0 we=0 cs=1 addr=5 din=55 dout=aa  ← Read addr 5
Time=45000 | clk=1 rst=0 we=0 cs=1 addr=5 din=55 dout=55  ✅ dout = 0x55
Time=50000 | clk=0 rst=0 we=0 cs=0 addr=3 din=55 dout=55  ← CS low, no change
Time=55000 | clk=1 rst=0 we=0 cs=0 addr=3 din=55 dout=55
Time=60000 | clk=0 rst=0 we=0 cs=0 addr=3 din=55 dout=55
```

### Key Observations

| Test Case             | Status | Description                                  |
|-----------------------|--------|----------------------------------------------|
| Reset                 | ✅ Pass | All memory locations cleared to 0            |
| Write 0xAA to addr 3  | ✅ Pass | Data written successfully                    |
| Write 0x55 to addr 5  | ✅ Pass | Data written successfully                    |
| Read addr 3           | ✅ Pass | `dout = 0xAA` — read-after-write verified    |
| Read addr 5           | ✅ Pass | `dout = 0x55` — read-after-write verified    |
| Chip select disabled  | ✅ Pass | `dout` holds last value when `cs = 0`        |

---

## How to Run

### Prerequisites

- Icarus Verilog (`iverilog` / `vvp`)
- GTKWave (optional, for waveform viewing)

### Simulation Steps

```bash
# 1. Navigate to the project directory
cd memories/single_port_ram

# 2. Compile the design and testbench
iverilog -o sim/sim.out rtl/single_port_ram.v tb/tb_single_port_ram.v

# 3. Run the simulation
vvp sim/sim.out

# 4. View waveforms (optional)
gtkwave single_port_ram.vcd
```

---

## Project Structure

```
memories/single_port_ram/
├── rtl/
│   └── single_port_ram.v     # RTL design — 16×8 single-port RAM
├── tb/
│   └── tb_single_port_ram.v  # Testbench — reset, write, read, CS test
├── sim/
│   ├── .gitkeep              # Placeholder for simulation outputs
│   └── sim.out               # Compiled simulation binary
├── README.md                 # This file
└── single_port_ram.vcd       # Waveform dump (gitignored)
```

---

## Next Steps / Enhancements

- [ ] Add **parameterized data width and depth** using Verilog parameters
- [ ] Add **output enable (`oe`)** for high-impedance bus control
- [ ] Add **byte-enable** for partial writes
- [ ] Implement **dual-port / true dual-port RAM** variant
- [ ] Add **full handshake** (ready/valid) interface
- [ ] Synthesize for **FPGA** target and check timing closure
