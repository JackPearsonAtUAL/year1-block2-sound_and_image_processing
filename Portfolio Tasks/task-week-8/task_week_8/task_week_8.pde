import processing.sound.*;

SoundFile bass;
SoundFile snare;
SoundFile hihat;
SoundFile crashCym;

float bpm = 120; // beats per minute

float myFrameRate = bpm / 60; // frame rate = beats per second

void setup(){
    size(600, 600);
    
    // Base
    bass = new SoundFile(this, "../samples/kick_w_echo_1s.wav");
    
    // Snare
    snare = new SoundFile(this, "../samples/Clicky wood 001.wav");
    
    // Hi-hat
    hihat = new SoundFile(this, "../samples/sample_plucked_glass.wav");

    // crashCym = crash simble file
    frameRate(myFrameRate);
}

void draw(){
    background(random(255), random(255), random(255));    
    
    // Crash cymbal at the start
    /*if(frameCount == 0){
        crashCym.play();
    }*/

    // Bass on all odd beats
    if (frameCount % 2 != 0) {
        bass.play();
    }

    // 'Snare' on very even beat
    if (frameCount % 2 == 0) {
        snare.play();
    }
    
    // Hi-hat on eighth beat
    if (frameCount % 8 == 0) {
       hihat.play(); 
       square((width/2)-50, (height/2)-50, 100);
    }  
}
