color[] colours = new color[4];

void setup(){
    colorMode(HSB);   
    size(800, 800);
    noStroke();
    
    colours[0] = color(getHue(), 100, getBrightness());
    colours[1] = color(getHue(), 100, getBrightness());
    colours[2] = color(getHue(), 100, getBrightness());
    colours[3] = color(getHue(), 100, getBrightness());

    //drawPattern();

}

void draw(){
  for (int x = 0; x < width/200; x++){
          for (int y = 0; y < height/200; y++){
              if((x%2 == 1 && y%2 == 1) || (x%2 == 0 && y%2 == 0)){
                  fill(colours[0]);
                  square(x * 200, y * 200, 200);
                  fill(colours[1]);
                  triangle(x*200, y*200, x*200+100, y*200, x*200, y*200+100); 
                  triangle(x*200+200, y*200+200, x*200+300, y*200, x*200, y*200+300);
                  fill(colours[2]);
                  circle(x*200+100, y*200+100, 50);
                  //circle(x*200+100, y*200+100, getSize(25, 75)); // Warning: fast movemnts / flashing lights
              }
              else{
                  fill(colours[3]);
                  square(x * 200, y * 200, 200);
                  fill(colours[2]);
                  triangle(x*200, y*200, x*200+100, y*200, x*200, y*200+100); 
                  triangle(x*200+200, y*200+200, x*200+300, y*200, x*200, y*200+300);
                  fill(colours[1]);
                  circle(x*200+100, y*200+100, 50);
                  //circle(x*200+100, y*200+100, getSize(25, 75)); // Warning: fast movemnts / flashing lights
              }
          }
      }
}

void keyPressed() {
    if (keyCode == 32){
        colours[0] = color(getHue(), 100, getBrightness());
        colours[1] = color(getHue(), 100, getBrightness());
        colours[2] = color(getHue(), 100, getBrightness());
        colours[3] = color(getHue(), 100, getBrightness());
    }
}

int getHue(){
    float f = (float) Math.random();
    f = map(f, 0.0, 1.0, 0, 360);
    return (int) f;
}

int getBrightness(){
    float f = (float) Math.random();
    f = map(f, 0.0, 1.0, 50, 100);
    return (int) f; 
}

int getSize(int min, int max){
    float f = (float) Math.random();
    f = map(f, 0.0, 1.0, min, max);
    return (int) f; 
}
