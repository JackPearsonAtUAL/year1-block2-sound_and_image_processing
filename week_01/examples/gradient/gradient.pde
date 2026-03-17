//Gradient variables
public int axis = 1;
public int gradientNum = 0;
public int lastGradient;

//Colour variables
public color leftC = color(0, 0, 0);
public color rightC = color(0, 0, 0);
public color[][] palettes = {
  {color(58, 1, 92), color(79, 1, 71), color(53, 1, 44), color(41, 0, 37), color(17, 0, 28)},
  {color(255, 106, 213), color(199, 116, 232), color(173, 140, 255), color(135, 149, 232), color(148, 208, 255)},
  {color(34, 87, 122), color(56, 163, 165), color(87, 204, 153), color(128, 237, 153), color(199, 249, 204)},
  {color(0, 117, 41), color(30, 88, 50), color(60, 59, 59), color(90, 30, 68), color(119, 0, 77)}
  
};
;

void setup() {
  size(500, 500);
}

void draw() {
  getGradient(gradientNum, axis);
}

void keyPressed() {
  if (keyCode == LEFT && 0 < gradientNum){
    gradientNum--;
    System.out.println(gradientNum);
    getGradient(gradientNum, axis);
  }

  if (keyCode == RIGHT && gradientNum < 4){
    gradientNum++;
    System.out.println(gradientNum);
    getGradient(gradientNum, axis);
  }
  
  if (keyCode == UP){
    axis = 0;
    System.out.println("up");
    getGradient(gradientNum, axis);
  }

  if (keyCode == DOWN){
    axis = 1;
    System.out.println("down");
    getGradient(gradientNum, axis);
  }
}

//Uses the gradientNum to determine the gradient
void getGradient(int i, int a) {
  if (i == 0){
    // Colour palette link: 
    // Gradient link: https://coolors.co/gradient-maker/ff1b6b-45caff
    leftC = color(255, 27, 107);//255, 27, 107
    rightC = color(69, 202, 255);//69, 202, 255
    makeGradient(leftC, rightC, a);
  }
  if (i == 1){
    // Colour palette link: https://coolors.co/palette/ff6ad5-c774e8-ad8cff-8795e8-94d0ff
    // Gradient link: https://coolors.co/gradient-maker/f756aa-f75672
    leftC = color(249, 133, 193); // Original colour: 247, 86, 170
    rightC = color(250, 133, 152); // Original colour: 247, 86, 114
    makeGradient(leftC, rightC, a);
  }
  if (i == 2){
    // Colour palette link: https://coolors.co/22577a-38a3a5-57cc99-80ed99-c7f9cc
    // Gradient link: https://coolors.co/gradient-maker/f7ba2c-ea5459
    leftC = color(247, 186, 44);
    rightC = color(234, 84, 89);
    makeGradient(leftC, rightC, a);
  }
  if (i == 3){
    // Colour palette link: 
    // Gradient link: https://coolors.co/gradient-maker/bf0fff-cbff49
    leftC = color(191, 15, 255);
    rightC = color(203, 255, 73);
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

  drawPalette(gradientNum);
}


// Method for drawing the colour palette
void drawPalette(int p){
  for(int i = 0; i < 5; i++){
    fill(palettes[p][i]);
    noStroke();
    square(i*100,400,100);
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


