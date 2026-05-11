/*
21/04/2026 (UK)
Lecture 7; Hour 2 Tasks 
Jack Pearson
*/

import processing.sound.*;
SinOsc sine1;
float freqMod;

// oscillators
SinOsc sin;

Oscillator[] oscillators; // individual oscillators subclass Oscillator, so we can do this
String[] oscnames;
//int currentOsc = 0;

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
    background(255);

    // overall volume of Sound library
    s = new Sound(this);
    s.volume(0.1);

    // setup  a bunch of oscillators
    SinOsc osc_One = new SinOsc(this); //Ocillator using mouse x
    //SinOsc osc_Two = new SinOsc(this); //Ocillator using LR arrows
    //SinOsc osc_Three = new SinOsc(this); //Ocillator using UD arrows

    oscillators = new Oscillator[] {osc_One};
    oscnames = new String[] { "Sine 1"};

    // Waveform analysis
    waveform = new Waveform(this, waveformSamples);

    // FFT analysis
    fft = new FFT(this, fftBands);

    setUpOscillators();

    // Create the sine oscillator.
    sine1 = new SinOsc(this);

    sine1.play();
    System.out.println(oscillators.length);
}

void draw() {
    if (paused == false) {
        updateSound();

        fill(255);

        // toggle UI based on FFT or Waveform
        // drawing function are in `visualisation.pde`.
        if (fftMode) {
        fftViz();
        } else {
        waveViz();
        }

        //text(oscnames[currentOsc], width-50, 15);
    }
}

void keyPressed() {
  if (keyCode == 32){
    pausePlay();
  }
}

// Put in setup(), as it only needs to be called once
void setUpOscillators(){
    // build a new filter for it
    if (filterEnabled){
        lpFilter = new LowPass(this);
    }
    for(int o = 0; o < oscillators.length; o++){
        // o is used to get each oscillator
        // connect new osc to other units
        if (filterEnabled){
            lpFilter.process(oscillators[o]);
        }
        waveform.input(oscillators[o]);
        fft.input(oscillators[o]);
    }

    pausePlay();
}

// Used to update the sounds
// Needs to be be in draw() for it to update every frame
void updateSound() {
    for(int o = 0; o < oscillators.length; o++){
        oscillators[o].amp(map(mouseY, height, 0, 0, 1));
        if (filterEnabled){
            lpFilter.freq(map(pow(mouseX, 2), 0, pow(width, 2), 100, 8000)); 
            // mapping square of mouseX
            // because filter curve is exponential
        } 
        else{
        oscillators[o].freq(map(pow(mouseX, 2), 0, pow(width, 2), 80, 2000));
        }
    }
}

// Triggered using the setUpOscillators()
// or by pressing SPACE
void pausePlay(){
    if (paused){
        for(int o = 0; o < oscillators.length; o++) {
            oscillators[o].play();
        }
    }
    else{
        for(int o = 0; o < oscillators.length; o++){
            oscillators[o].stop();
        }
       
    }
    paused = !paused;
}
