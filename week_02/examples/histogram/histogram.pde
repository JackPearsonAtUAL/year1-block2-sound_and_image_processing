PImage sample;

// settings() runs before setup() and is meant specifically for dynamic sizing
void settings() {
  sample = loadImage("sample2.jpg");
  pixelDensity(1);
  size(sample.width, sample.height);
}

void setup() {
  noLoop();
}

void draw() {
  sample.loadPixels();
  loadPixels();

  int[][] histogram = new int[3][256];

  for (int i = 0; i < sample.pixels.length && i < pixels.length; i++) {
    int r = int(red(sample.pixels[i]));
    int g = int(green(sample.pixels[i]));
    int b = int(blue(sample.pixels[i]));

    pixels[i] = color(r, g, b);

    histogram[0][r]++;
    histogram[1][g]++;
    histogram[2][b]++;
  }

  updatePixels();

  int maxR = max(histogram[0]);
  int maxG = max(histogram[1]);
  int maxB = max(histogram[2]);

  // Draw Red Histogram
  for (int i = 0; i < 256; i++) {
    stroke(255, 0, 0, 150);
    float startHeight = map(histogram[0][i], 0, maxR, height, height - (height / 3));

    // Map 'i' (0-255) to the full width of the canvas
    float xPos = map(i, 0, 255, 0, width);
    line(xPos, startHeight, xPos, height);
  }

  // Draw Green Histogram
  for (int i = 0; i < 256; i++) {
    stroke(0, 255, 0, 150);
    float startHeight = map(histogram[1][i], 0, maxG, height, height - (height / 3));

    float xPos = map(i, 0, 255, 0, width);
    line(xPos, startHeight, xPos, height);
  }

  // Draw Blue Histogram
  for (int i = 0; i < 256; i++) {
    stroke(0, 0, 255, 150);
    float startHeight = map(histogram[2][i], 0, maxB, height, height - (height / 3));

    float xPos = map(i, 0, 255, 0, width);
    line(xPos, startHeight, xPos, height);
  }
}