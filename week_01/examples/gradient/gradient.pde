//Gradient variables
boolean isOnXAxis = true;
int gradientNum = 1;
int lastGradient;

//Colour variables
int colour_red = 255;
int colour_green = 0;
int colour_blue = 255;
color leftC = color(0, 0, 0);
color rightC = color(0, 0, 0);

void setup() {
  size(300, 300);
}

void draw() {
  getPalette(gradientNum);
}

//Uses the gradientNum to determine the gradient
void getPalette(int i) {
  if (i == 0){
    makeGradient();
  }
  if (i == 1){
    makeGradient(leftC, rightC, isOnXAxis);
  }
}

void makeGradient() {
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      // Calculate a color based on the x-coordinate.
      // You can adjust these values to change the gradient's appearance.
      float normalizedX = map(x, 0, width - 1, 0, 1); // Normalize x to 0-1
      int red = int(colour_red * normalizedX);            // Red increases with x
      int green = colour_green;                             // Green stays at 0
      int blue = int(colour_blue * (1 - normalizedX));     // Blue decreases with x

      // Create the color
      color c = color(red, green, blue);

      // Set the pixel
      pixels[x + y * width] = c; // Correctly index the 1D pixel array
    }
  }
  updatePixels();
}

/*
Resource used for code assistance:
https://processing.org/examples/lineargradient.html
*/
void makeGradient(color c1, color c2, boolean axis){
  noFill();
  
  if (axis){
    for (int i = height; i <= width+height; i++){
      float inter = map(i, height, height+width, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(width, i, width*2, i);
    }
  }
  else if(!axis){
    for (int i = width; i <= width+height; i++){
      float inter = map(i, width, width*2, 0, 1);
      color c = lerpColor(c1, c2, inter); 
      stroke(c);
      line(i, height, i, height*2);
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT && 0 < gradientNum){
    gradientNum--;
  }

  if (keyCode == RIGHT && gradientNum < 5){
    gradientNum++;
  }
  
  getPalette(gradientNum);
}
