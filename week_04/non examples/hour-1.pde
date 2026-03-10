float xpos = 0;
float xstep = 10; 
float factor, ypos;

void setup() {
  size(600, 400); 
  rectMode(CENTER); 
}


void draw() {
  drawLine();
  
}

void drawLine(){
  background(0); 
  
  delay(30);
  beginShape();
  for (int i = 0; i < width*2; i++) {
    
    stroke(255);
    noFill();

    factor = float(i)/20; //PLAY
    ypos = map(noise(factor, frameCount*0.1), 0, 1, 0, height); 
    
    vertex(xpos + (xstep*i), ypos); 
      
  }
  endShape();
}
