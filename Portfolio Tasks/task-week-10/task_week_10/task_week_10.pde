import java.util.Iterator;

float xpos = 0;
float xstep = 20; 

float minSize = 1;
float maxSize = 2;
float acceleration = 1;

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

void keyPressed() {
  if (keyCode == LEFT){
    if (acceleration > 1){
      acceleration -= 0.01;
    }
  }

  if (keyCode == RIGHT){
    if (acceleration < 10){
      acceleration += 0.01;
    }
  }
  
  if (keyCode == UP){
    if (maxSize < 15){
      maxSize += 1;
      minSize += 1;
    }
  }

  if (keyCode == DOWN){
    if (minSize > 1){
      maxSize -= 1;
      minSize -= 1;
    }
  }
}

void updateMain(){   

  for (Iterator<Snow> i = snowflakes.iterator(); i.hasNext();){
    Snow s = i.next();
    s.update();

    // Snow despawn logic
    if (s.position.y > height+20){
        i.remove();
    }
  } 
}

void genSnowflakes(){
  if ((int)(Math.random() * 101)/5 >= 10){
    Snow s = new Snow();
    s.position = new PVector(map(((float)Math.random() * 101), 0, 100, 10, width - 20), 0);
    s.size = map((float)Math.random(), 0, 1, minSize, maxSize);
    
    s.acceleration = new PVector(0, acceleration);
    s.velocity = new PVector(random(-1, 1), random(-2, 0));
    snowflakes.add(s);
  }
}
