/*
24/02/2026 (UK)
Histograms
Jack Pearson; Maksym Kheilik
*/

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
        // Bubble sort by hue
        for (){
            
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