//Gradient variables
public int axis = 1;
public int gradientNum = 0;
public int lastGradient;

//Colour variables
public color leftC = color(0, 0, 0);
public color rightC = color(0, 0, 0);

void setup() {
  size(300, 300);
}

void draw() {
  getPalette(gradientNum, axis);
}

void keyPressed() {
  if (keyCode == LEFT && 0 < gradientNum){
    gradientNum--;
    System.out.println(gradientNum);
    getPalette(gradientNum, axis);
  }

  if (keyCode == RIGHT && gradientNum < 5){
    gradientNum++;
    System.out.println(gradientNum);
    getPalette(gradientNum, axis);
  }
  
  if (keyCode == UP && gradientNum < 5){
    axis = 0;
    System.out.println("up");
    getPalette(gradientNum, axis);
  }

  if (keyCode == DOWN && gradientNum < 5){
    axis = 1;
    System.out.println("down");
    getPalette(gradientNum, axis);
  }
}

//Uses the gradientNum to determine the gradient
void getPalette(int i, int a) {
  if (i == 0){
    // Gradient link: https://coolors.co/gradient-maker/ff1b6b-45caff
    leftC = color(255, 27, 107);
    rightC = color(69, 202, 255);
    makeGradient(leftC, rightC, a);
  }
  if (i == 1){
    // Gradient link: https://coolors.co/gradient-maker/f756aa-f75672
    leftC = color(247, 86, 170);
    rightC = color(247, 86, 114);
    makeGradient(leftC, rightC, a);
  }
  if (i == 2){
    leftC = color(10, 255, 100);
    rightC = color(90, 100, 20);
    makeGradient(leftC, rightC, a);
  }
  if (i == 3){
    leftC = color(10, 255, 100);
    rightC = color(90, 100, 20);
    makeGradient(leftC, rightC, a);
  }
  if (i == 4){
    leftC = color(10, 255, 100);
    rightC = color(90, 100, 20);
    makeGradient(leftC, rightC, a);
  }
}


/*
Resource used for code assistance:
https://processing.org/examples/lineargradient.html
*/
void makeGradient(color c1, color c2, int axis ) {

  noFill();

  if (axis == 0) {  // Top to bottom gradient
    for (int i = 0; i <= 0+height; i++) {
      float inter = map(i, 0, height, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(0, i, width, i);
    }
  }  
  else if (axis == 1) {  // Left to right gradient
    for (int i = 0; i <= 0+width; i++) {
      float inter = map(i, 0, width, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, 0, i, height);
    }
  }
}

/*
Code given for class
Not used for this project, but decided to keep fo possible future referencing 

public void makeGradient() {
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
*/


