import java.util.ArrayList; // Import the ArrayList class
PImage sample;

// settings() runs before setup() and is meant specifically for dynamic sizing
void settings() {
    sample = loadImage("sample.jpg");
    pixelDensity(1);
    size(sample.width, sample.height);
}

void setup() {
    noLoop();
    colorMode(HSB);

    sample.loadPixels();
    for (int y = 0; y < sample.height; y++) {
        // Collect pixels for this row
        color[] row = new color[sample.width];
        for (int x = 0; x < sample.width; x++) {
            row[x] = sample.pixels[y * sample.width + x];
        }

        // Reorder the list
        color[] cols = {};
        for (int p = 0; p < row.length-1; p++){
            for (int h = 0; h < row.length-p-1; h++){
                if (brightness(row[h]) < brightness(row[h+1])){
                    color temp = row[h];
                    row[h] = row[h+1];
                    row[h+1] = temp;
                }
            }
        }

        // Write back
        for (int x = 0; x < sample.width; x++) {
            sample.pixels[y * sample.width + x] = row[x];
        }
    }

    sample.updatePixels();
    image(sample, 0, 0);
    save("sorted.png");
}

// Variation One
// Swapping the x and y values also swapping the height and width parameters.
// sorted(1).png
/*
void setup() {
    noLoop();

    sample.loadPixels();
    for (int y = 0; y < sample.height; y++) {
        // Collect pixels for this row
        color[] row = new color[sample.width];
        for (int x = 0; x < sample.width; x++) {
            row[x] = sample.pixels[y * sample.width + x];
        }
        // Sort by brightness
        row = sort(row);
        // Write back
        for (int x = 0; x < sample.width; x++) {
            sample.pixels[y * sample.width + x] = row[x];
        }
    }

    sample.updatePixels();
    image(sample, 0, 0);
    save("sorted.png");
}
*/

// Variation Two
// Buiding on V1, bubble sort the pixels based on their hue, going from lowest to highest
// sorted(2).png
/* 
void setup() {
    noLoop();
    colorMode(HSB);

    sample.loadPixels();
    for (int y = 0; y < sample.height; y++) {
        // Collect pixels for this row
        color[] row = new color[sample.width];
        for (int x = 0; x < sample.width; x++) {
            row[x] = sample.pixels[y * sample.width + x];
        }

        // Reorder the list
        color[] cols = {};
        for (int p = 0; p < row.length-1; p++){
            for (int h = 0; h < row.length-p-1; h++){
                if (hue(row[h]) > hue(row[h+1])){
                    color temp = row[h];
                    row[h] = row[h+1];
                    row[h+1] = temp;
                }
            }
        }

        // Write back
        for (int x = 0; x < sample.width; x++) {
            sample.pixels[y * sample.width + x] = row[x];
        }
    }

    sample.updatePixels();
    image(sample, 0, 0);
    save("sorted.png");
}
*/

// Variation Three
// Much simpler variation of V2, it just sorts the pixels from high to low hues
// sorted(3).png
/*
void setup() {
    noLoop();
    colorMode(HSB);

    sample.loadPixels();
    for (int y = 0; y < sample.height; y++) {
        // Collect pixels for this row
        color[] row = new color[sample.width];
        for (int x = 0; x < sample.width; x++) {
            row[x] = sample.pixels[y * sample.width + x];
        }

        // Reorder the list
        color[] cols = {};
        for (int p = 0; p < row.length-1; p++){
            for (int h = 0; h < row.length-p-1; h++){
                if (hue(row[h]) < hue(row[h+1])){
                    color temp = row[h];
                    row[h] = row[h+1];
                    row[h+1] = temp;
                }
            }
        }

        // Write back
        for (int x = 0; x < sample.width; x++) {
            sample.pixels[y * sample.width + x] = row[x];
        }
    }
*/

// Variation Four
// This is an adaptation of V3, using brughtness instead of hue
// sorted(4).png
/*
void setup() {
    noLoop();
    colorMode(HSB);

    sample.loadPixels();
    for (int y = 0; y < sample.height; y++) {
        // Collect pixels for this row
        color[] row = new color[sample.width];
        for (int x = 0; x < sample.width; x++) {
            row[x] = sample.pixels[y * sample.width + x];
        }

        // Reorder the list
        color[] cols = {};
        for (int p = 0; p < row.length-1; p++){
            for (int h = 0; h < row.length-p-1; h++){
                if (brightness(row[h]) < brightness(row[h+1])){
                    color temp = row[h];
                    row[h] = row[h+1];
                    row[h+1] = temp;
                }
            }
        }

        // Write back
        for (int x = 0; x < sample.width; x++) {
            sample.pixels[y * sample.width + x] = row[x];
        }
    }
*/

// Variation Five
// This is an adaptation of V2, using brughtness instead of hue
// sorted(5).png
/*
void setup() {
    noLoop();
    colorMode(HSB);

    sample.loadPixels();
    for (int y = 0; y < sample.height; y++) {
        // Collect pixels for this row
        color[] row = new color[sample.width];
        for (int x = 0; x < sample.width; x++) {
            row[x] = sample.pixels[y * sample.width + x];
        }

        // Reorder the list
        color[] cols = {};
        for (int p = 0; p < row.length-1; p++){
            for (int h = 0; h < row.length-p-1; h++){
                if (brightness(row[h]) > brightness(row[h+1])){
                    color temp = row[h];
                    row[h] = row[h+1];
                    row[h+1] = temp;
                }
            }
        }

        // Write back
        for (int x = 0; x < sample.width; x++) {
            sample.pixels[y * sample.width + x] = row[x];
        }
    }
*/