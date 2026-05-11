import processing.sound.*;

// noise oscillators

WhiteNoise white; // random amps across all freqs
PinkNoise pink;   // ...with a 3db per octave decrease, sounds more 'even'
BrownNoise brown; // ...with a 6db per octave decrease, more like human hearing
                  // as in "Brownian motion" (sometimes 'red noise')
                  // looks like there's a bug in this one, it's far too loud.
                  
SoundObject[] oscillators; // individual noises subclass SoundObject, so we can do this
String[] oscnames;
int currentOsc = 0;

// filter
LowPass lpFilter;
boolean filterEnabled = false;

// analysis stuff
Waveform waveform;
int waveformSamples = 512;

FFT fft;
int fftBands = 512;
float[] spectrum = new float[fftBands];

// modal stuff
boolean paused = false;
boolean fftMode = false;

// global sound object for handling volume
Sound s;

void setup() {
  size(600, 600);

  // overall volume of Sound library
  s = new Sound(this);
  s.volume(0.6);

  // setup  a bunch of oscillators
  white = new WhiteNoise(this);
  pink = new PinkNoise(this);
  brown = new BrownNoise(this);
  
  oscillators = new SoundObject[] { white,pink,brown};
  oscnames = new String[] { "White", "Pink", "Brown" };

  // Waveform analysis
  waveform = new Waveform(this, waveformSamples);

  // FFT analysis
  fft = new FFT(this, fftBands);

  // finally, make the first oscillator our current one
  selectOsc(0);
}

void draw() {
  if (!paused) {
    updateSound();
    
    fill(255);

    // toggle UI based on FFT or Waveform
    // drawing function are in `visualisation.pde`.
    if (fftMode) {
      fftViz();
    } else {
      waveViz();
    }
    
    text(oscnames[currentOsc],width-50,15);
  }
}

void selectOsc(int o) {
  // stop the old oscillator
  oscillators[currentOsc].stop();

  // select the new oscillator
  currentOsc = o;

  // build a new filter for it
  if (filterEnabled) {
    lpFilter = new LowPass(this);
  }

  // connect new osc to other units
  if (filterEnabled) {
    lpFilter.process(oscillators[currentOsc]);
  }
  waveform.input(oscillators[currentOsc]);
  fft.input(oscillators[currentOsc]);

  // play the new oscillator
  oscillators[currentOsc].play();
  println(oscnames[currentOsc]);
}

void keyPressed() {
  switch(key) {
  case '1':
    selectOsc(0);
    break;
  case '2':
    selectOsc(1);
    break;
  case '3':
    selectOsc(2);
    break;
  case 'p':
    paused = !paused;
    break;
  case 'f':
    filterEnabled = !filterEnabled;
    selectOsc(currentOsc);
    println("Filter toggled"); 
    break;
  case TAB:
    fftMode = !fftMode;
    break;
  }
}

void updateSound() {
  oscillators[currentOsc].amp(map(mouseY, height, 0, 0, 1));
  if(filterEnabled) {
    lpFilter.freq(map(pow(mouseX,2), 0, pow(width,2), 100, 8000)); // mapping square of mouseX
                                                                   // because filter curve is exponential
  }
}
