# 1. Base Clocks
create_clock -name clk_i -period 40.0 [get_ports clk_i]
# Define the clock on the output of the new delay buffer, not the XOR gate directly
create_clock -name seq_clk -period 10.0 [get_pins clock_delay_buffer/Z]

# 2. Generated Clock for the Output Register
# Update the source to the delayed clock
create_generated_clock -name eoc_clk -source [get_pins clock_delay_buffer/Z] -divide_by 9 [get_nets eoc]

# 3. Clock Groups
set_clock_groups -asynchronous \
    -group {clk_i} \
    -group {seq_clk eoc_clk}

# 4. Input/Output Delays
set_input_delay -clock clk_i 5.0 [get_ports {rst_n}]
set_output_delay -clock eoc_clk 5.0 [get_ports {d_out[*]}]
# CRITICAL FIX: d_ctrl is driven by sar_reg, which is clocked by seq_clk, NOT clk_i
set_output_delay -clock seq_clk 5.0 [get_ports {d_ctrl[*]}] 
set_output_delay -clock seq_clk 5.0 [get_ports {d_ctrl_n[*]}]

# 5. Delay Chain Protection (Strobe generation)
# The max/min delays are still good for reporting timing
set_max_delay 60.0 -from [get_ports {out_p out_n}] -to [get_ports clk_o]
set_min_delay 45.0 -from [get_ports {out_p out_n}] -to [get_ports clk_o]

# 6. Design Rules
set_load 0.010 [all_outputs]
set_max_transition 2.5 [current_design] 
set_max_fanout 32 [current_design]

# 7. Protect Manual Trees
set_ideal_network [get_nets rst_n_tree]