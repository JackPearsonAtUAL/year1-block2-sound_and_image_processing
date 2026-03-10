PImage img;
PGraphics pg;

void settings() {
    img = loadImage("sample.jpg");
    pixelDensity(1);
    size(img.width, img.height);
}

void setup() {
    colorMode(HSB);
    size(img.width, img.height);

    pg = createGraphics(img.width, img.height, JAVA2D); // Use JAVA2D renderer!

    // Initialize PGraphics with the image (once)
    pg.beginDraw();
    pg.image(img, 0, 0);
    pg.endDraw();

}

void draw() {
    // 1. Copy the *original* image to a temporary PImage
    PImage tempImg = createImage(img.width, img.height, RGB);
    tempImg.copy(img, 0, 0, img.width, img.height, 0, 0, img.width, img.height);
    tempImg.loadPixels(); // Load pixels for the temp image

    // 2. Perform pixel manipulation on the temporary image's pixels
    for (int i = 0; i < tempImg.pixels.length; i++) {
        color c = tempImg.pixels[i];
        float h = hue(c);
        float s = saturation(c);
        float b = brightness(c);

        // Y axis controls the brightness
        float briShift = map(0, mouseY, height, 0, 100);
        float newBri = (b + briShift) % 100;
        if (newBri < 0) {
        newBri += 100;
        }

        // X axis controls the saturation
        float satShift = map(mouseX, 0, width, 0, 100);
        float newSat = (s + satShift) % 100;
        if (newSat < 0) {
        newSat += 100;
        }

        tempImg.pixels[i] = color(h, newSat, newBri);
    }
    
    tempImg.updatePixels(); // Update the temp image's pixels

    // 3. Draw the modified temporary image to the PGraphics context
    pg.beginDraw();
    pg.image(tempImg, 0, 0); // Draw the modified tempImg
    pg.endDraw();

    // 4. Draw the PGraphics context to the screen
    image(pg, 0, 0);
}
