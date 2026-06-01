import processing.sound.*;

Oscillator[] oscillators;
SawOsc texOsc;
SinOsc bkgrOsc;
TriOsc highOsc;

LowPass[] filters = new LowPass[3];

// goes in order of saw, sin, tri
// saw = sin + at least 1 octave (>= *2 freq)
// sin = low note
// tri = high note, quite volume
float[] amps = {0.5, 0.2, 0.01};
float[] freqs = {600, 200, 1000};



void setup() {
  size(400,400);

  texOsc = new SawOsc(this);
  bkgrOsc = new SinOsc(this);
  highOsc = new TriOsc(this);

  oscillators = new Oscillator[] {texOsc, bkgrOsc, highOsc};
  
  for (int i = 0; i < oscillators.length; i++){
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
  freqs[0] = map(randomNum(), 0, 1, 599, 601);
  freqs[1] = map(randomNum(), 0, 1, 199, 201);
  if (amps[0] > 0.2){
    amps[0] -= 0.0001;
  }
  if (amps[1] > 0.1){
    amps[1] -= 0.0001;
  }
  if (amps[2] < 1){
    amps[2] += 0.001;
    freqs[2] += 0.01;
  }
  //amps[2] = map(randomNum(), 0, 1, 0.001, 0.1);

  reloadOsc();
}

float randomNum(){
  float i = (float)Math.random();
  return i;
}

void reloadOsc(){
  for (int i = 0; i < oscillators.length; i++){
    oscillators[i].freq(freqs[i]);
    oscillators[i].amp(amps[i]);
  }
}