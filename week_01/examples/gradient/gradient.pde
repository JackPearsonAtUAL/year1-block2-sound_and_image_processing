int gradientNum = 0;

colour_red = 255;
colour_green = 0;
colour_blue = 255;

void setup(){
  size(400, 300);
}

void draw(){
  getPalette(gradientNum);

}

void getPalette(i){
  makeGradient();
}

void makeGradient(){
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

void keyPressed(){
  if (keyCode === 37 && 0 < gradientNum < 5){
    gradientNum--
  }

  if (keyCode === 39 && 0 < gradientNum < 5){
    gradientNum++
  }

}
