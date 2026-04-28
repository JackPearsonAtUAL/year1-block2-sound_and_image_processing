import processing.sound.*;

SoundFile[] samples;

float bpm = 120; // beats per minute

float myFrameRate = bpm / 60; // frame rate = beats per second

void setup(){
    size(600, 600);
    
    // Base
    samples[0] = new SoundFile(this, "../samples/Clicky wood 001.wav");
    
    // Snare
    samples[1] = new SoundFile(this, "../samples/kick_w_echo_1s.wav");
    
    // Hi-hat
    samples[2] = new SoundFile(this, "../samples/sample_plucked_glass.wav");

    // samples[3] = crash simble
    frameRate(myFrameRate);
}

void draw(){
    background(random(255), random(255), random(255));    
    
    // Crash cymbal at the start
    if(frameCount == 0){
        samples[3].play();
    }

    // Bass on all odd beats
    if (frameCount % 2 != 0) {
        samples[0].play();
    }

    // 'Snare' on very even beat
    if (frameCount % 2 == 0) {
        samples[1].play();
    }
    
    // Hi-hat on eighth beat
    if (frameCount % 8 == 0) {
       samples[2].play(); 
    }  
}
