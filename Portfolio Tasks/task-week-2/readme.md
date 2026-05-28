# Week 2: Manipulating and Analysing Pixels
## Disclaimer
AI was used as a search engine tool for researching pixel sorting algorithms.

## Task, part 1.

1. Open the histogram sketch. It's a script which converts a photo into black and white, and shows a histogram of brightness.
Working in pairs - as a Driver and Navigator - try to adapt the code so that it shows the image in its original colour, and then show three histograms: one for each of the R, G, B channels.
2. Try it with a different image of your choice.
3. Advanced: Make a copy of the sketch, swap colour channels, and display histograms for those.

## Task, part 2.

1. Have a look at this blog post on glitch art made by pixel sorting:
https://glitchology.com/pixel-sorting/
2. Make your own piece of glitch art and document it in your portfolio. You're encouraged to experiment with multiple versions and approaches.

## Personal Thoughts and Reflection
For this week I will admit that I struggled sightly. For the first task, which was done in pairs, where we had to make the histogram de-grayscle, I didn't have to much of an issue. I just needed to look into how color() and colour chanels worked in processing to figure out how the grayscaling works. Once I understood that, both Maksym and myself realised we needed to store each pixel's RGB value before it was converted into grayscale.

Originally Makysm chose to did this by having 3 different 1D int arrays, each holding an r, g, or b value. Once he implamented the 3 arrays, I suggested a more clean and efficient way of storing the RGB values; one 2D array. This ended up being slightly more efficient and kept down the number of variable names used. 

After this I moved onto solo work, making it so that the code would show the values for the CMY spectrum instead of RGB. This was mostly done in the histogram drawing section, where a singular colour woud be entered, the average of two colours would be instead. For example:

        // Red
        stroke(255, 0, 0, 150);
        float startHeight = map(histogram[0][i], 0, maxR, height, height - (height / 3));
        
        Became:
        
        // Yellow
        stroke(255, 255, 0, 150);
        float startHeight = map((histogram[0][i] + histogram[1][i])/2, 0, maxR, height, height - (height / 3));

Moving onto part 2, this was entirely solo work. The base for the code was taken from https://glitchology.com/pixel-sorting/. The first variation, *sorted(1).png*, was me just messing around with the code provided and seeing what would happen when changing vertain values. Variation 2, *sorted(2).png*, uses a bubble sort to order the pixels in each row from lowest to highest hue. Variation 3, *sorted(3).png*, is the inverse. Variation 4, *sorted(4).png*,, and variation 5, *sorted(5).png*, are using brightness instead of hue. 

The last variation, which is the code currently within draw() inside *w2_task_p2.pde*. It's output can be found in *sorted.png*.

For this one I took the code for my hue bubble sort and spent some time figuring out how I could get my code to use columns instead of rows. After looking at how a few different programs did this, I settled on the following lines to sort through the columns:
            
    for (int y = 0; y < sample.height; y++){
    col[y] = sample.pixels[y * sample.width + x];
    }

After this it was just a case of continuing to do my normal sorting algorithm. At the end, because I was using the height instead of width, the for loop's condition changed to reflect this.

At the end of this task, I feel that the vertical sort looks much better compared to the horisontal. I find that there is much more of a resemblance of a person in the horizontal sorts, rather than the vertical ones, which look more abstract.
        

