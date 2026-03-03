/*
03/02/2026 (UK)
Rotating Squares
Jack Pearson
*/

float angle = 0;

float xpos = 80;
float xstep = 60;

void setup() {
  size(400, 400);
  rectMode(CENTER);
}

void draw(){
  background(0);
  for (int i = 0; i < 7; i++){
    DrawSquares(i);
  }
}

public void DrawSquares(float f){
  pushMatrix();
    fill(153,50,204);
    translate(xpos + (f*50), height/2);
    rotate(radians(angle *f));
    rect(0, 0, 50, 50); // notice the position is 0,0
    angle = angle + f;
  popMatrix();
}