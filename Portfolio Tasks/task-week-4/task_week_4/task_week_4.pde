import java.util.Iterator;

float xpos = 0;
float xstep = 20; 

float factor, ypos;
int frames;

public ArrayList<Snow> snowflakes = new ArrayList<Snow>(0);

void setup(){
  size(600, 600);
  rectMode(CENTER);
  colorMode(RGB);

  // Integral to delaying the drawing of the snow
  frameRate(60);
  frames = int(frameRate);
}

void draw(){
  background(0);
  genSnowflakes();
  updateMain();
}

void updateMain(){       
  drawAroura();

  for (Iterator<Snow> i = snowflakes.iterator(); i.hasNext();){
    Snow s = i.next();
    s.update(frameCount);

    // Snow despawn logic
    if (s.position[1] > height+20){
        i.remove();
    }
  } 
}

void drawAroura(){
   
  fill(color(100, 255, 200, 200));
  delay(50);
  beginShape();
  
  vertex(0, 0);
  
  float lastVertX = 0;
  float lastVertY = 0;
  
  for (int i = 0; i < width; i++) {
    
    noStroke();

    factor = float(i)/20; //PLAY
    ypos = map(noise(factor, frameCount*0.1), 0, 1, 0, height*0.75); 
    
    // Smoothing vertex
    vertex((xpos + (xstep*i)+lastVertX)/2, (ypos+lastVertY)/2);
    
    // Main Vertex
    vertex(xpos + (xstep*i), ypos); 
    
    lastVertX = xpos + (xstep*i);
    lastVertY = ypos;
    
  }
  vertex (width, 0);
  endShape();
}

void genSnowflakes(){
  if ((int)(Math.random() * 101)/5 >= 10){
    Snow s = new Snow();
    s.position = new float[]{map((int)(Math.random() * 101), 0, 100, 10, width - 20), 0};
    s.size = map(noise(frameCount * 0.1 + 200, frameCount * 0.02), 0, 1, 1, 5);
    snowflakes.add(s);
  }
}
