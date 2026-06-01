# Week 7: Digital Sound and Oscillation
## Disclaimer
AI was solely used to think assist with ideas for what to do with the oscillators in this week's task. It was not used to create any of the code for this task.

## Week 7 Task

1. (Required minimum) Using at least 3 oscillators and/or filters, try to design a sound for a sci-fi movie, when the main characters arrive onto a new planet. <br><br>Frequency modulation - alternate the frequency over time<br>
Feel free to add filters if you want to.<br>

**Please note: there are a lot of examples in the repository. You're not expected to immediately understand all of them. Feel free to use them as a reference, but please make sure you understand the basic ones first.**

2. (A bit more advanced) Pick a sketch from one of the previous weeks. Try to use the output from an oscillator as a parameter for the sketch. You may need to map it to a different domain. You can use it for example to control colour, shape or size of elements in your sketch.

## Personal Thoughts and Reflection
I will admit, I did save this task for last. Mostly because I was dreading using oscillators to make music. Truth be told I don't have a musical bone in my body. However with that being said, this task still needed to get done.

I began with setting up each of the 3 oscillators, before I even had an idea of what to do. This was done using and slightly modifying the code used in the week 7 example: `oscillator_demos.pde`. After this, I then needed to figure out how to use each of the oscillators; therefore, it was off to the internet. 

After a very nice and concise summary of what type of sound each oscillator variation produces, I had chosen my options. These were Saw, Sin and Tri. This is the general reasoning for each:

    Saw: used to produce a higher octave sound, good for adding 'texture' to the music.
    Sin: useed to create lower, bass like background noise.
    Tri: good for generating high pitch sounds, but needs to be played at a lower volume.

Now I needed to hear what kind of music would play, for the task senario, in real movies. After having a little look, I liked the way that the instrumental part of << Alien: Earth >> sounded. To try and get the effect used in the theme, I minutely incremented the Tri oscillator's amp and frequency each frame, whilst dropping the amp of the Saw and Sin oscillators by a similar amount. This gave the effect of th Tri oscillator getting louder, without in reality getting too loud.

I learnt first hand wat happens when the amp is increased too much and my ears stayed ringing for a while. Therefore, I put a minmax cap on each of the amps and frequencies. This meant the amp value for each oscillator woudn't go over 1, meaning the volume wouldn't become unbearable. 

To add a touch of randomness to the code, I made it so the frequencies of the Saw and Sin oscillators fluctuated ever so slightly, just to break up the monotone frequency.