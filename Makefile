# ==================================================
# Verilog Fundamentals Makefile
# Usage:
# make PROJECT=combinational/half_adder
# make wave PROJECT=combinational/half_adder
# make clean PROJECT=combinational/half_adder
# make commit MSG="Add half adder"
# ==================================================

IVERILOG = iverilog
VVP = vvp
GTKWAVE = gtkwave

PROJECT ?=

SRC = $(wildcard $(PROJECT)/*.v)
SIM = $(PROJECT)/sim

.PHONY: all run wave clean commit

all:
	$(IVERILOG) -o $(SIM) $(SRC)
	cd $(PROJECT) && $(VVP) sim

wave:
	cd $(PROJECT) && $(GTKWAVE) *.vcd

clean:
	rm -f $(PROJECT)/sim
	rm -f $(PROJECT)/*.vcd

commit:
	git add .
	git commit -m "$(MSG)"
	git push