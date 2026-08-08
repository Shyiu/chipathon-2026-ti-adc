SIM ?= icarus
TOPLEVEL_LANG ?= verilog

# Your Verilog sources
VERILOG_SOURCES += $(CURDIR)/mock_cells.sv
VERILOG_SOURCES += /foss/designs/chipathon-2026-ti-adc/src/sar_adc_logic/sar_adc_logic.sv

# The name of the top-level module in your Verilog file
TOPLEVEL = sar_adc_logic

# The name of your Python test file (without the .py extension)
MODULE = test_sar

# Tell Cocotb to dump waves
# EXTRA_ARGS += -s tb_wrapper
export WAVES=1

include $(shell cocotb-config --makefiles)/Makefile.sim