# 1. Base Clocks
create_clock -name clk_i -period 40.0 [get_ports clk_i]
create_clock -name valid_clk -period 5.5 [get_pins valid_clk_xor/Z]

# 2. Generated Clock for the Output Register
create_generated_clock -name eoc_clk -source [get_pins valid_clk_xor/Z] -divide_by 9 [get_nets eoc]

# 3. Clock Groups
set_clock_groups -asynchronous \
    -group {clk_i} \
    -group {valid_clk eoc_clk}

# 4. Input/Output Delays
set_input_delay -clock clk_i 5.0 [get_ports {rst_n}]
set_output_delay -clock eoc_clk 5.0 [get_ports {dout[*]}]
set_output_delay -clock clk_i 5.0 [get_ports {dac_ctrl[*]}]

# 5. Asynchronous Delay Chain Constraints (25 MS/s Target)
set_max_delay 60 -from [get_ports {out_p out_n}] -to [get_ports clk_o]
set_min_delay 45 -from [get_ports {out_p out_n}] -to [get_ports clk_o]

# 6. Design Rules
set_load 0.010 [all_outputs]
set_max_transition 2.5 [current_design] 
set_max_fanout 32 [current_design]

# 7. Protect Manual Trees
set_ideal_network [get_nets rst_n_tree]