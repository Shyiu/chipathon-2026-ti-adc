import cocotb
from cocotb.triggers import Timer, RisingEdge, FallingEdge

@cocotb.test()
async def simulate_sar_adc_back_to_back(dut):
    """Simulate two back-to-back SAR ADC conversions."""
    
    # Set two distinct mock analog target values
    TARGET_VALUES = [170, 85]  # 170 = 10101010, 85 = 01010101
    
    # 1. Initialize inputs
    dut.rst_n.value = 0
    dut.clk_i.value = 0
    dut.out_p.value = 0
    dut.out_n.value = 0

    # 2. Global System Reset
    await Timer(10, unit="ns")
    dut.rst_n.value = 1
    await Timer(10, unit="ns")

    # Run consecutive conversions
    for cycle, target_value in enumerate(TARGET_VALUES):
        dut._log.info(f"--- STARTING CONVERSION CYCLE {cycle + 1} ---")
        
        # 3. Track Phase
        dut._log.info("Entering Tracking Phase...")
        dut.clk_i.value = 0
        await Timer(100, unit="ns")

        # 4. Convert Phase
        dut._log.info(f"Entering Conversion Phase... (Targeting: {target_value})")
        dut.clk_i.value = 1 # High = Convert
        
        # 8-bit resolution = 8 clock strobes
        for bit in range(8):
            # Wait for the async ring to strobe the comparator
            await RisingEdge(dut.clk_o)
            
            # Read the current digital trial value the DAC is outputting
            trial_val = int(dut.d_ctrl.value)
            dut._log.info(f"Bit {7-bit}: ADC trying DAC value {trial_val}")
            
            # Simulate the physical comparator propagation delay
            await Timer(5, unit="ns")
            
            # Python acting as the analog comparator
            if trial_val > target_value:
                dut.out_p.value = 1
                dut.out_n.value = 0
            else:
                dut.out_p.value = 0
                dut.out_n.value = 1
                
            # Wait for the ADC to process our decision and drop the strobe
            await FallingEdge(dut.clk_o)
            
            # Reset comparator to standard state for the next bit
            await Timer(2, unit="ns")
            dut.out_p.value = 0
            dut.out_n.value = 0

        # Wait for the EOC (End of Conversion) logic to settle and latch d_out
        await Timer(50, unit="ns")
        
        # 5. Verify the final result
        final_result = int(dut.d_out.value)
        dut._log.info(f"Conversion {cycle + 1} complete! ADC Output: {final_result}")
        
        assert final_result == target_value, f"Mismatch! Expected {target_value}, got {final_result}"
        
        # Return to track phase to prepare for the next cycle loop
        dut.clk_i.value = 0
        await Timer(50, unit="ns")
        
    dut._log.info("All back-to-back conversions passed successfully!")