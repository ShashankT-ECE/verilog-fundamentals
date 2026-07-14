# ==========================================================
# Verilog Fundamentals - Root Makefile
# ==========================================================

# -----------------------------
# Tools
# -----------------------------
IVERILOG := iverilog
VVP       := vvp
GTKWAVE   := gtkwave

# -----------------------------
# Output executable
# -----------------------------
SIM := sim

# -----------------------------
# Project directory
# Example:
# make PROJECT=combinational/half_adder
# -----------------------------
ifndef PROJECT
$(error Usage: make PROJECT=<project_directory>)
endif

# -----------------------------
# Automatically find files
# -----------------------------
SRC := $(wildcard $(PROJECT)/*.v)

# -----------------------------
# Targets
# -----------------------------
.PHONY: all compile run wave clean status commit help

all: compile run

# -----------------------------
# Compile
# -----------------------------
compile:
	@echo ""
	@echo "========== COMPILING =========="
	$(IVERILOG) -o $(PROJECT)/$(SIM) $(SRC)
	@echo "Compilation Successful."

# -----------------------------
# Run Simulation
# -----------------------------
run:
	@echo ""
	@echo "========== RUNNING =========="
	cd $(PROJECT) && $(VVP) $(SIM)

# -----------------------------
# Open Waveform
# -----------------------------
wave:
	@echo ""
	@echo "========== OPENING GTKWAVE =========="
	cd $(PROJECT) && $(GTKWAVE) *.vcd

# -----------------------------
# Clean Generated Files
# -----------------------------
clean:
	@echo ""
	@echo "========== CLEANING =========="
	rm -f $(PROJECT)/$(SIM)
	rm -f $(PROJECT)/*.vcd

# -----------------------------
# Git Status
# -----------------------------
status:
	git status

# -----------------------------
# Commit & Push
# Usage:
# make commit PROJECT=combinational/half_adder
# -----------------------------
commit:
	@git add .
	@git commit -m "Add $(notdir $(PROJECT)) RTL and testbench"
	@git push

# -----------------------------
# Help
# -----------------------------
help:
	@echo ""
	@echo "========== Verilog Fundamentals =========="
	@echo ""
	@echo "Compile + Run:"
	@echo "  make PROJECT=<project_directory>"
	@echo ""
	@echo "Open Waveform:"
	@echo "  make wave PROJECT=<project_directory>"
	@echo ""
	@echo "Clean:"
	@echo "  make clean PROJECT=<project_directory>"
	@echo ""
	@echo "Git Status:"
	@echo "  make status"
	@echo ""
	@echo "Commit & Push:"
	@echo "  make commit PROJECT=<project_directory>"
	@echo ""