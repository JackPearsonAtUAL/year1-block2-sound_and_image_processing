# Week 8: Algorithmic music and sampling
## Disclaimer
AI was not used in the process of making this week's task.

## Directory contents
* [code examples](./examples)

## Week 8 Task
Using at least 4 samples, create a drum pattern. Make the pattern change in time. You could do that by:
    - adding an element of randomness to at least one of the samples,
    - alternate the pattern depending on time, e.g. count bars based on frameCount, seconds or milliseconds

How to start (optional prompts):

- Pick some samples from the resources below (or find or record your own), and modify the example from class using them.
- Pick a drum pattern or a beat from a song from the examples below (or your own example), and try to replicate it. If you're a beginner, replicating one of these would be a good start: Essential drum patterns (for hip hop).
- Design your own beat using clapping, visuals, or however you like, and try to replicate it.


(Optional). Can you add an audio-reactive visualisation? For this, you may want to increase the frameRate to achieve a smooth animation. For example, if you want the music to play at 120 bpm, which is 2 times per second, set the frameRate to 60 and play the base sound every 30th frame (frameCount % 30 == 0).
(Advanced). Can you combine sound synthesised with an oscillator (task from last week) with looped samples in a single piece of music?

** Have a look at the additional resources on Moodle **
(articles, free sample sources, technical documentation)

## Personal Thoughts and Reflection
For this week, I chose to use AC / DC's song 'Back In Black' for the drum pattern. I mostly chose this song, as it has a simple and easy to edit 4 beat per bar chord, with the addition of every 8 beats a snare drum. 

To make this drum progression change, I added an element of contained ranndomness. Every draw() cycle the rate(), processing's audio play speed, for each audio sample.

Orignially this random element was going to affect each sample's amp(), processing's audio volume. However, I did not like how this turned out as, even with a min/max value, the volume would sometimes be too quiet or not change enough.

This is why I decided on rate(). There are 4 different values it can use and each are distinctly different from one another. These values are 0 (nothing plays), 0.5 (half speed), 1 (normal speed) and 2 (double speed).

After obta8ining some new samples, I swapped the original sound files for actual drum samples. However I had an idea. What if I had the old sound files randomly play instead of the new? I did this by setting up a random number generator, which is fed into an if condition, that will determine which sond file plays.

Once this was completed, I went to test this out. I tried out three different variation, and found that the rate(0.5) sounded terrible with the new randomness. Therefore I made it so that the rate would either be 1 or 2, which works much better. Out of the 3 different demo videos I made this week, I prefer the random speed on it's own, followed by the random instruments. I found that putting together both random variables resulted in a cacophony.