import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import os

# Map your filenames to the EXACT order of the nets in your wrdata command
FILES = {
    '/headless/.xschem/simulations/cdac.txt': ['vref', 'vx', 'vcm', 'vsample', 'phi_top', 'phi_bottom'],
    '/headless/.xschem/simulations/logic.txt': ['ctrl0', 'ctrl1', 'ctrl2', 'ctrl3', 'ctrl4', 'ctrl5', 'ctrl6', 'ctrl7', 'dout0', 'dout1', 'dout2', 'dout3', 'dout4', 'dout5', 'dout6', 'dout7', 'clk', 'phi_top', 'phi_bottom'],
    '/headless/.xschem/simulations/trans_gate.txt': ['v(vin)', 'v(vsample)', 'v(clk)', 'phi_bottom'],
    '/headless/.xschem/simulations/comparator.txt': ['clk_o', 'outp', 'outn', 'clk'],
}

def read_ngspice_wrdata(filepath):
    # ... (Keep this function exactly the same as before) ...
    if not os.path.exists(filepath):
        print(f"Warning: {filepath} not found.")
        return []

    try:
        data = np.loadtxt(filepath)
    except Exception as e:
        print(f"Error reading {filepath}: {e}")
        return []

    if data.ndim == 1:
        data = data.reshape(1, -1)

    num_cols = data.shape[1]
    signals = []
    
    for i in range(0, num_cols, 2):
        if i + 1 < num_cols:
            time = data[:, i]
            val = data[:, i+1]
            signals.append((time, val))
            
    return signals

def main():
    # 1. Create stacked subplots
    file_list = list(FILES.keys())
    fig = make_subplots(
        rows=len(file_list), 
        cols=1, 
        shared_xaxes=True,
        subplot_titles=file_list,
        vertical_spacing=0.05
    )

    # 2. Parse and plot the data using your custom labels
    for i, filename in enumerate(file_list):
        row_num = i + 1
        signals = read_ngspice_wrdata(filename)
        label_list = FILES[filename]
        
        for sig_idx, (t, v) in enumerate(signals):
            shape = 'hv' if 'logic' in filename else 'linear'
            
            # Safely grab the label, or fallback to generic if you forgot one
            if sig_idx < len(label_list):
                sig_name = label_list[sig_idx]
            else:
                sig_name = f"Unknown Signal {sig_idx + 1}"
            
            fig.add_trace(
                go.Scatter(
                    x=t, 
                    y=v, 
                    mode='lines',
                    line_shape=shape,
                    name=sig_name,
                    legendgroup=filename,
                    legendgrouptitle_text=filename
                ),
                row=row_num, 
                col=1
            )

    # 3. Apply theme and layout
    fig.update_layout(
        title="SAR ADC Mixed-Signal Waveform Viewer",
        template="plotly_dark",
        hovermode="x unified",
        height=900,
        legend=dict(
            groupclick="toggleitem",
            yanchor="top",
            y=0.99,
            xanchor="left",
            x=1.01
        )
    )

    for i in range(len(file_list)):
        fig.update_yaxes(title_text="Voltage (V)", row=i+1, col=1)
        
    fig.update_xaxes(title_text="Time (s)", row=len(file_list), col=1)

    fig.show()

if __name__ == "__main__":
    main()