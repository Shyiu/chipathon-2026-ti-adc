import cocotb
from cocotb.triggers import Timer, RisingEdge, FallingEdge, Edge

async def monitor_non_overlap(dut):
    """Background task to strictly check the sampling spec."""
    while True:
        await Edge(dut.clk_i)
        
        if dut.clk_i.value == 1: # Rising edge (entering Convert)
            # Spec: phi_top opens first
            assert dut.phi_top.value == 0, "phi_top did not close immediately!"
            assert dut.phi_bottom.value == 1, "phi_bot closed too early! Non-overlap failed."
            
            # Wait for phi_bot to fall (the Δt delay)
            await FallingEdge(dut.phi_bottom)
            dut._log.info("Non-overlap check passed: phi_bot fell after phi_top.")
            
        else: # Falling edge (entering Track)
            # Both should go high to sample Vcm and Vin
            await Timer(1, unit="ns") # Give gates a moment to settle
            assert dut.phi_top.value == 1 and dut.phi_bottom.value == 1, "Switches didn't close for track phase!"


@cocotb.test()
async def simulate_sar_adc(dut):
    """Simulate a single SAR ADC conversion."""
    
    # Start the background non-overlap checker
    cocotb.start_soon(monitor_non_overlap(dut))
    
    # Set a mock analog target value (e.g., 170 out of 255 for an 8-bit ADC)
    TARGET_VALUE = 170
    
    # 1. Initialize inputs
    dut.rst_n.value = 0
    dut.clk_i.value = 0
    dut.out_p.value = 0
    dut.out_n.value = 0

    # 2. Reset the system
    await Timer(10, unit="ns")
    dut.rst_n.value = 1
    await Timer(10, unit="ns")

    # 3. Track Phase
    dut._log.info("Starting Tracking Phase...")
    dut.clk_i.value = 0
    await Timer(100, unit="ns")

    # 4. Convert Phase
    dut._log.info(f"Starting Conversion Phase... (Target: {TARGET_VALUE})")
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
        if trial_val > TARGET_VALUE:
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
    
    # Return to track phase
    dut.clk_i.value = 0
    await Timer(50, unit="ns")
    
    # 5. Verify the final result
    final_result = int(dut.d_out.value)
    dut._log.info(f"Conversion complete! ADC Output: {final_result}")
    
    assert final_result == TARGET_VALUE, f"Mismatch! Expected {TARGET_VALUE}, got {final_result}"