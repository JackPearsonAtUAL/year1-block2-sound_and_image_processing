import processing.sound.*;

SawOsc[] oscillators = new SawOsc[3];
LowPass[] filters = new LowPass[3];
float[] amps = {1, 0, 0.2};
float[] freqs = {1250, 0, 1};

/* Frequencies:
Main osc = 1246 <= 1250 < 1270
Background osc
Supporting osc
*/

/* Amps:
Main osc = 
Background osc
Supporting osc
*/


void setup() {
  size(400,400);
  
  for (int i = 0; i < oscillators.length; i++){
    oscillators[i] = new SawOsc(this);
    // more about filters in Processing: https://processing.org/reference/libraries/sound/index.html
    filters[i] = new LowPass(this);
    
    filters[i].process(oscillators[i]);
  
    oscillators[i].freq(freqs[i]);
    oscillators[i].amp(amps[i]);
    
    oscillators[i].play();
  }
}

void draw() {
  background(0);
}
