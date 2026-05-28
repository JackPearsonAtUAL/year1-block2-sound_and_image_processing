# Week 3: Vector Graphics
## Disclaimer
AI was not used in the process of making this week's task.

## Directory contents

* Code sample for the anti-alias, pushpopMatrix and blend examples are in `examples/`

## Week 3 Portfolio Task

Using Processing, make an abstract artwork. It should:
- Use at least 3 different primitives,
- Use the modulo ('%') operator to create a pattern. You can use it for example to alternate between different shapes or colours.
- If you want to, you're welcome to use one of your p5 sketches as a starter. Please make sure to include a reference link if you do.

## Controls
    Tap SPACE to generate colour palette once

    Hold space to quickly generate new colour palettes

## Personal Thoughts and Reflection
For me, this week is a ramp down in difficulty from last week. Last block, I did something similar in p5.js, so, I knew what I was doing this time round. I wanted to make a mosaic tile pattern, similar to the week 2 task of block 1. For the most part, I just picked everything at random, the shapes, positioning and colouration; until I found a variation that I liked.

After having the 1 on 1 meeting about this portfolio project, I decided to add a few more random parts to the code, just to make it slightly more complex. Initially I decided to make a randomised colour and size for each shape. However after implamentaion, I quickly discoverd I had made a slight error. Instead of setting the size and colour at the start I did it in every loop of draw(). I removed the code which caused the error and made it so that the colour palette is randomised when pressing the space bar. 

Just as a warning, the video of this project has a part at the end of rapidly changing colours and brightness, to demonstrate what happens when the space bar is held down. 