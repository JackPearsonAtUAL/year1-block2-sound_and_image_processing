void setup(){
    colorMode(HSB);
    size(800, 800);
    noStroke();
}

void draw(){
    for (int x = 0; x < width/200; x++){
        for (int y = 0; y < height/200; y++){
          if((x%2 == 1 && y%2 == 1) || (x%2 == 0 && y%2 == 0)){
                fill(0);
                square(x * 200, y * 200, 200);
                fill(64);
                triangle(x*200, y*200, x*200+100, y*200, x*200, y*200+100); 
                triangle(x*200+200, y*200+200, x*200+300, y*200, x*200, y*200+300);
                fill(191);
                circle(x*200+100, y*200+100, 50);
          }
          else{
                fill(255);
                square(x * 200, y * 200, 200);
                fill(191);
                triangle(x*200, y*200, x*200+100, y*200, x*200, y*200+100); 
                triangle(x*200+200, y*200+200, x*200+300, y*200, x*200, y*200+300);
                fill(64);
                circle(x*200+100, y*200+100, 50);
          }
      }
    }
}
