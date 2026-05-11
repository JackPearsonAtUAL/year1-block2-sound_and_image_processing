import processing.sound.*;

// soundfile

SoundFile amen;

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

  // setup soundfile
  amen = new SoundFile(this, "amen_clipped.wav");
  
  // Waveform analysis
  waveform = new Waveform(this, waveformSamples);

  // FFT analysis
  fft = new FFT(this, fftBands);

  setupWavFile();
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
  }
}

void setupWavFile() {
  // build a new filter for it
  if (filterEnabled) {
    lpFilter = new LowPass(this);
  }

  // connect new osc to other units
  if (filterEnabled) {
    lpFilter.process(amen);
  }
  waveform.input(amen);
  fft.input(amen);

  // play the new oscillator
  amen.loop();
}

void keyPressed() {
  switch(key) {
  case 'p':
    paused = !paused;
    break;
  case 'f':
    filterEnabled = !filterEnabled;
    setupWavFile();
    println("Filter toggled"); 
    break;
  case TAB:
    fftMode = !fftMode;
    break;
  }
}

void updateSound() {
  amen.amp(map(mouseY, height, 0, 0, 1));
  if(filterEnabled) {
    lpFilter.freq(map(pow(mouseX,2), 0, pow(width,2), 100, 8000)); // mapping square of mouseX
                                                                   // because filter curve is exponential

  } else {
    amen.rate(pow(2,map(mouseX,0,width,-1,1)));
  }
}
