# Week 6: Dithering and Convolution
## Disclaimer
AI was not used in the process of making this week's task.

## Dependancies
Make sure the following library is installed
Video Library for Processing 4 

## Task
- Implement a real-time image processing system using your webcam.
- Combine a dithering algorithm with one of the filters we looked at in Week 4.
- The processed image should update continuously as the webcam feed changes, showing both the dithering effect and the selected filter.
- Use the saveFrame function to make a story reel of up to 10 pictures like in a comic book.
- Experiment with different dithering parameters, algorithms, colours, etc. Save screenshots from at least 3 different versions to the portfolio.
- Add a frame drawn in Processing to the camera feed.

## Controls
    S saves the current image

    ENTER / RETURN changes to the next filter

## Personal Thoughts and Reflection
For this week, I was stuck trying to figure out the best filter to work with the dithering algorithms. At first I tried to use the invert colours filter, however it either stopped the dithering occuring, or broke the code. This was due to dithering oly working on images made of two colors.

I then wanted to move onto a sepia filer, however I found that it too wouldn't work, as sepia requires the image to be in RGB, not Black and White. 

While I couldn't use the sepia filter, it did give me an idea for which filter to choose. This was the duotone filter. This allows me to directly change the black and white pixels to other colours, using the greyscale value of the pixel.

My first variation of this used a Red/Cyan filter, where Black was replaced with Red and White the same with Teal. Afterwards I was wandering how I could make this interactive, while also implamenting different variations. 

After deliberating for a bit and looking back on previous projects, I decided to make it so that upon pressing the ENTER / RETURN key, the filter would cycle forward. As for the other filter variations, I decided to make a pattern where Black is replaced by either Red/Green/Blue and White is replaced by the combination of the other two. 

Out of the three I like the 3rd one(Blue/Yellow) the most. It is the most comfortable on the eyes and also reminds me of how dogs see colour, as they have protanopia colour blindness. 