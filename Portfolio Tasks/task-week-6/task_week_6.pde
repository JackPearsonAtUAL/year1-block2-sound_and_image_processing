/*
Base code has been taken from the following files:
week_06/examples/dither/dither.pde


Make sure the following library is installed
Video Library for Processing 4 

This piece is interective:
  pressing the (S) key saves the image
  pressing the (Enter)/(Return) key changes the filter
*/

import processing.video.*;

public int filterNum = 0;

public Capture cam;
PImage newimage;

void setup() {
  size(640, 480);
  pixelDensity(1);
  frameRate(20);
  
  // this code sets up `cam` as a Capture device, using the first camera
  // on your computer.
  // if this doesn't work: speak to Tom
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, 640,480,cameras[0], 30);
    cam.start();     
  }      
}

void draw() {
  // every frame, if the camera is ready, we update `cam` to have
  // the latest data from it
  if (cam.available() == true) {
    cam.read();   
  }
  
  // to draw the new image pixel-by-pixel:
  // the Capture object (cam) has a property "pixels" that works just like a screen.
  loadPixels();
  cam.loadPixels();
  
  newimage = createImage(width, height, RGB);
  newimage.loadPixels();
  for(int i = 0; i < cam.pixels.length; i++) {
    color originalColours = color(cam.pixels[i]);
    float greyValue = red(cam.pixels[i]); // Makes camera output greyscale
    
    // threshold pixel to either black or white.
    float newPixelValue = 0;

    if (greyValue > random(255)){
      newPixelValue = 255;
    }

    float error = greyValue - newPixelValue;
    
    newimage.pixels[i] = color(newPixelValue);

    // Aplies the dithering
    atkinsonDither(i, error);

    if (filterNum == 0){
      color colA = color(255, 0, 0);
      color colB = color(0, 255, 255);
      newimage.pixels[i] = duotone(newimage.pixels[i], colA, colB);
    }
    else if (filterNum == 1){
      color colA = color(0, 255, 0);
      color colB = color(255, 0, 255);
      newimage.pixels[i] = duotone(newimage.pixels[i], colA, colB);
    }
    else if (filterNum == 2){
      color colA = color(0, 0, 255);
      color colB = color(255, 255, 0);
      newimage.pixels[i] = duotone(newimage.pixels[i], colA, colB);
    }

  }
  updatePixels();
  
  image(newimage, 0, 0);
}

void keyPressed() {
  // pressing S will save the current frame to disk
  if(key == 's') {
    saveFrame("frame-######.jpg");
  }
  if (keyCode == ENTER || keyCode == RETURN){   
    filterNum++;

    if (filterNum > 2){
      filterNum = 0;
    }
  }
}

void fsDither(int i, float error) {
  // Floyd-Steinberg Dithering
  //
  // x is the current pixel:
  //
  //  .  x  7
  //  3  5  1
  //  (all /16)

  int[] offsets = {
    1, width-1, width, width+1
  };

  float[] ditherRatios = {
    7/16.0, 3/16.0, 5/16.0, 1/16.0
  };

  for (int j = 0; j < offsets.length; j++) {
    int neighbourIndex = i + offsets[j];
    if (neighbourIndex < pixels.length) {
      float neighbourGrey = red(pixels[neighbourIndex]);
      pixels[neighbourIndex] = color(neighbourGrey + (error*ditherRatios[j]));
    }
  }
}

void atkinsonDither(int i, float error) {
  // Atkinson Dithering
  //
  // x is the current pixel:
  //
  //  .  x  1  1
  //  1  1  1  .
  //  .  1  .  .
  //  (all / 8)


  int[] offsets = {
    1, 2, width-1, width, width+1, width*2
  };

  for (int j = 0; j < offsets.length; j++) {
    int neighbourIndex = i + offsets[j];
    if (neighbourIndex < pixels.length) {
      float neighbourGrey = red(pixels[neighbourIndex]);
      pixels[neighbourIndex] = color(neighbourGrey + (error/8.0));
    }
  }
}

color duotone(color pixel, color colorA, color colorB) {
  float tone = red(pixel);
  
  float lerpAmount = norm(tone,0,255);
  
  return lerpColor(colorA, colorB, lerpAmount);
}
