# 1. Base Clocks
create_clock -name clk_i -period 40.0 [get_ports clk_i]
# Define the clock on the output of the delay buffer, not the XOR gate directly
create_clock -name seq_clk -period 10.0 [get_pins clock_delay_buffer/Z]

# 2. Generated Clock for the Output Register
create_generated_clock -name eoc_clk -source [get_pins clock_delay_buffer/Z] -divide_by 9 [get_nets eoc]

# 3. Clock Groups
set_clock_groups -asynchronous \
    -group {clk_i} \
    -group {seq_clk eoc_clk}

# 4. Input/Output Delays
set_input_delay -clock clk_i 5.0 [get_ports {rst_n}]
set_output_delay -clock eoc_clk 5.0 [get_ports {d_out[*]}]

# d_ctrl is driven by sar_reg (clocked by seq_clk)
set_output_delay -clock seq_clk 5.0 [get_ports {d_ctrl[*]}] 
set_output_delay -clock seq_clk 5.0 [get_ports {d_ctrl_n[*]}]

# Constrain the comparator inputs relative to the sequence clock
set_input_delay -clock seq_clk 2.0 [get_ports {out_p out_n}]

# 5. Exceptions & False Paths
# CRITICAL FIX: EOC forcing the DAC to zero is a parking operation at the end 
# of conversion, not a timing-critical path for the SAR loop.
set_false_path -from [get_clocks eoc_clk] -to [get_ports {d_ctrl[*] d_ctrl_n[*]}]

# The non-overlap clocks and ring oscillator trigger are asynchronous/structural.
# We false-path them to clear the unconstrained endpoint warnings.
set_false_path -to [get_ports {clk_o phi_top phi_top_n phi_bottom phi_bottom_n}]

# 6. Design Rules
set_load 0.010 [all_outputs]
set_max_transition 2.5 [current_design] 
set_max_fanout 32 [current_design]

# 7. Protect Manual Trees
set_ideal_network [get_nets rst_n_tree]