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

    // Set framerate
    frameRate(myFrameRate);
}

void draw(){
    // Crash cymbal at the start
    /*if(frameCount == 0){
        crashCym.rate(1)
        crashCym.play();
    }*/

    // Bass on all odd beats
    if (frameCount % 2 != 0) {
        background(0);
        bass.rate(rateChanger());
        bass.play();
    }

    // 'Snare' on very even beat
    if (frameCount % 2 == 0) {
        background(255);
        
        // Hi-hat on eighth beat
        if (frameCount % 8 == 0) {
            hihat.rate(rateChanger());
            hihat.play(); 
            fill(255, 0, 255);
            square((width/2)-50, (height/2)-50, 100);
        }  

        snare.rate(rateChanger());
        snare.play();
    }   
}

float rateChanger(){
    float newRate = (float)Math.random();
    newRate = map(newRate, 0, 1, 0.5, 1.5);

    // Half speed
    if (newRate <= 0.75){
        return newRate = 0.5;
    }

    // Normal speed
    if (newRate > 0.75 && newRate < 1.25 ){
        return newRate = 1;
    }

    // Fast speed
    if (newRate >= 1.25){
        return newRate = 2;
    }

    return 1;
}
