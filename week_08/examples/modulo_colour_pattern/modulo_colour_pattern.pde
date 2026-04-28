color[] colours = {
  color(0, 0, 0), // black
  color(255, 255, 255), // white
  color(255, 0, 0), // red
  color(0, 0, 255) // blue
};
int coloursCount = colours.length;

void setup() {
  size(400, 400);

  println(coloursCount);

  background(220);

  for (int y = 0; y<12; y++){
    for( int i=0; i<12; i++ ) {
      color fillColour = colours[(i+y) % coloursCount];
      fill(fillColour);
      
      circle(35 + (i*30), 35+(y*30), 30);
    }
  }

}
