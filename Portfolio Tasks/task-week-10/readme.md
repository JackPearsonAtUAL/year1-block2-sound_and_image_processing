# Week 10: Particle Systems
## Disclaimer
AI was not used in the process of making this week's task.

## Task
Create an interactive sketch implementing Particle Systems and ArrayLists. The sketch should have:

at least 3 vectors (PVector) for each particle: location, velocity, acceleration,
at least one type of user interaction impacting the system,
at least 1 randomised force impacting the system (e.g. wind).

Feel free to use the optional prompts below:
- Petals falling from blossom tress,
- Leaves falling in the autumn,
- Snow,
- Cosmic explosion, cosmic dust or falling stars,
- Sea creatures such as plankton.

## Controls
    LEFT (arrow) slows snow

    RGHT (arrow) speeds up snow

    UP (arrow) enlarges snow

    DOWN (arrow) shrinks snow

## Personal thoughts and Reflection
This task is actually quite simple for me, as I have already made a sort of particle system twice, once in week 4 and once in week 9.

For the location vector, the code from week 4 already includes a noise jitter to reseble how snow doesn't fall in direct lines. As for the acceleration, it is determined by the user, whilst the velocity is randomised between two points for both axis.

Now in the demo video, there are a couple of strange things which occur. Firstly, the snowflakes get stuck on the top of the window. This has been fixed. It was caused by an oversight in the code, which meant the snow could have a velocity of 0 and -0.1. This has now been patched. The second part is the strange trailling blue of the snowflakes when falling at a high velocity. This is not actually an error in the code, as there is nowhere that creates a blue trail. While I cannot be certain which it is, it is either: an optical illusion, or, the my recording software being unable to keep up with the speed, resulting in a form of artefacting.