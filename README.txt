Psychoacoustic Tuning Curve Measurement Tool, by Andrew Barrette

ABOUT:
This program uses a two-block "turnaround" noise-masking method to measure the shape of the PTC. The idea is to measure the amplitude threshold required for a sine tone to be heard over a noise mask consisting of a step function of noise that starts some Offset from the frequency of the sine tone. This threshold is measured for different offsets of the noise step from sine frequency, and the resulting f-vs-threshold data is differentiated to obtain the power spectrum of the hearing "oscillator" at the sine frequency. Broader power spectrum corresponds to loss of frequency resolution in the subject.

HOW TO RUN:
- To start program, run startinggui.m. A window (optionsgui.fig) will open allowing the parameters of the experiment to be determined. For the casual user, default settings are sufficient.
- At end of experiment, results are displayed (f vs. I and f_rel vs. P). All experiment parameters and data are saved to workspace in structure 'vars'. Save 'vars' structure under a name of your choosing to preserve experiment results.

OPTIONS:
- "This sound is ___ dB"	For accurate power spectrum result, headphones must be calibrated. Connect a quality microphone to a dB meter then hold it up to the headphone ear and press "This sound is" button. Enter the measured dB rating in the provided field.
- Noise settings		Noise mask consists of oscillators with spacing S and starting at frequency F and ending at F+W. Use "Noise mask width", "Noise mask spacing", and "Notch offset" to specify W, S, and F, respectively.
- Experiment trial settings	The final measured filter will consist of N datapoints at f, f+s, f+2*s, etc. Use "Tone f", "Mask shift per point", and "Number of points" to specify f, s, and N, respectively.
- Threshold estimation		With a good guess for the starting threshold, the experiment can finish much quicker. To choose a starting estimate for the threshold, click and drag the slider to different points on the slider bar to find the right-most point at which the tone can no longer be heard.

TROUBLESHOOTING:
- If "Generating Sound..." is visible when optionsgui.fig is opened, then the program will likely fail. Close optionsgui.fig and rerun startinggui.m.
- For less than two points, f_rel vs P will not be displayed upon completion of experiment.