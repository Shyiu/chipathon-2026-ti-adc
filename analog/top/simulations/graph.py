import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import os

# The files you want to analyze
FILES = ['dac.txt', 'logic.txt', 'comparator.txt']

def read_ngspice_wrdata(filepath):
    """
    Parses Ngspice wrdata format.
    wrdata outputs columns as: time1, val1, time2, val2, ...
    Returns a list of tuples: [(time_array, val_array), ...]
    """
    if not os.path.exists(filepath):
        print(f"Warning: {filepath} not found.")
        return []

    try:
        # Load the raw text file
        data = np.loadtxt(filepath)
    except Exception as e:
        print(f"Error reading {filepath}: {e}")
        return []

    # Handle single-row edge cases
    if data.ndim == 1:
        data = data.reshape(1, -1)

    num_cols = data.shape[1]
    signals = []
    
    # Extract each (time, value) pair
    for i in range(0, num_cols, 2):
        if i + 1 < num_cols:
            time = data[:, i]
            val = data[:, i+1]
            signals.append((time, val))
            
    return signals

def main():
    # 1. Create stacked subplots (one row per file) with linked X-axes
    fig = make_subplots(
        rows=len(FILES), 
        cols=1, 
        shared_xaxes=True,
        subplot_titles=FILES,
        vertical_spacing=0.05
    )

    # 2. Parse and plot the data
    for i, filename in enumerate(FILES):
        row_num = i + 1
        signals = read_ngspice_wrdata(filename)
        
        for sig_idx, (t, v) in enumerate(signals):
            # We use a step shape for logic, linear for analog DAC/Comparator
            shape = 'hv' if 'logic' in filename else 'linear'
            
            fig.add_trace(
                go.Scatter(
                    x=t, 
                    y=v, 
                    mode='lines',
                    line_shape=shape,
                    name=f"Signal {sig_idx + 1}",
                    legendgroup=filename,
                    legendgrouptitle_text=filename
                ),
                row=row_num, 
                col=1
            )

    # 3. Apply a beautiful dark theme and unify the hover tooltips
    fig.update_layout(
        title="SAR ADC Mixed-Signal Waveform Viewer",
        template="plotly_dark",
        hovermode="x unified",
        height=900,
        legend=dict(
            groupclick="toggleitem", # Allows clicking individual traces or the whole group
            yanchor="top",
            y=0.99,
            xanchor="left",
            x=1.01
        )
    )

    # Automatically set Y-axis titles
    for i in range(len(FILES)):
        fig.update_yaxes(title_text="Voltage (V)", row=i+1, col=1)
        
    fig.update_xaxes(title_text="Time (s)", row=len(FILES), col=1)

    # 4. Render the graph in your default web browser
    fig.show()

if __name__ == "__main__":
    main()