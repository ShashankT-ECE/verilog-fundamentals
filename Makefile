# ==============================================================================
# Root Makefile for verilog-fundamentals
#
# Usage:
#   make PROJECT=combinational/half_adder          -> compile + simulate
#   make wave PROJECT=combinational/half_adder      -> open waveform
#   make clean PROJECT=combinational/half_adder     -> remove generated files
#   make status                                     -> git status
#   make commit MSG="commit message"                -> git add, commit, push
#   make help                                       -> show usage
# ==============================================================================

SHELL := /bin/bash

IVERILOG := iverilog
VVP      := vvp
GTKWAVE  := gtkwave
SIM      := sim

.DEFAULT_GOAL := run
.PHONY: run wave clean status commit help

# ------------------------------------------------------------------
# Guard: fail with a clear message if PROJECT wasn't given
# ------------------------------------------------------------------
define require_project
	if [ -z "$(PROJECT)" ]; then \
		echo ""; \
		echo "Usage:"; \
		echo "  make PROJECT=combinational/half_adder"; \
		echo ""; \
		exit 1; \
	fi ; \
	if [ ! -d "$(PROJECT)" ]; then \
		echo ""; \
		echo "Error: directory '$(PROJECT)' does not exist."; \
		echo ""; \
		exit 1; \
	fi
endef

# ------------------------------------------------------------------
# Compile + simulate
# ------------------------------------------------------------------
run:
	@$(require_project)
	@echo "==> Compiling all Verilog sources in $(PROJECT)"
	@$(IVERILOG) -o $(PROJECT)/$(SIM) $(PROJECT)/*.v
	@echo "==> Running simulation"
	@cd $(PROJECT) && $(VVP) $(SIM)

# ------------------------------------------------------------------
# Open waveform in GTKWave
# ------------------------------------------------------------------
wave:
	@$(require_project)
	@vcd=$$(ls $(PROJECT)/*.vcd 2>/dev/null | head -n1); \
	if [ -z "$$vcd" ]; then \
		echo "No .vcd file found in $(PROJECT)."; \
		echo "Run 'make PROJECT=$(PROJECT)' first."; \
		exit 1; \
	fi; \
	echo "==> Opening $$vcd in GTKWave"; \
	env -u LD_LIBRARY_PATH -u LD_PRELOAD -u GTK_PATH -u GTK_EXE_PREFIX \
	    -u GIO_MODULE_DIR -u GSETTINGS_SCHEMA_DIR -u GTK_IM_MODULE_FILE -u LOCPATH \
	    $(GTKWAVE) "$$vcd" &

# ------------------------------------------------------------------
# Clean generated files only (sim binary + vcd)
# ------------------------------------------------------------------
clean:
	@$(require_project)
	@echo "==> Cleaning generated files in $(PROJECT)"
	@rm -f $(PROJECT)/$(SIM) $(PROJECT)/*.vcd

# ------------------------------------------------------------------
# Git helpers
# ------------------------------------------------------------------
status:
	@git status

commit:
	@if [ -z "$(MSG)" ]; then \
		echo ""; \
		echo "Usage:"; \
		echo "  make commit MSG=\"Your commit message\""; \
		echo ""; \
		exit 1; \
	fi
	@git add .
	@git commit -m "$(MSG)"
	@git push

# ------------------------------------------------------------------
# Help
# ------------------------------------------------------------------
help:
	@echo "Available commands:"
	@echo "  make PROJECT=<path>            Compile + simulate a project"
	@echo "  make wave PROJECT=<path>       Open the waveform in GTKWave"
	@echo "  make clean PROJECT=<path>      Remove sim executable + .vcd"
	@echo "  make status                    Show git status"
	@echo "  make commit MSG=\"message\"      git add + commit + push"
	@echo "  make help                       Show this help"
	@echo ""
	@echo "Examples:"
	@echo "  make PROJECT=combinational/half_adder"
	@echo "  make wave PROJECT=combinational/half_adder"
	@echo "  make PROJECT=sequential/up_counter"
	@echo "  make commit MSG=\"Add Half Adder RTL and testbench\""