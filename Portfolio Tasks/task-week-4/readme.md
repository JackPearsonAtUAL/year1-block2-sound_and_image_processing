# Week 4: Filtering Images
## Disclaimer
AI was not used in the process of making this week's task.

## Task
Using noise and primitive shapes, create an animated scene in 2D (standard) or 3d (advanced).

Extra:

    import 3d models.
    add user interactions allowing for exploring the environment.
    make it into a game?

## Personal Thoughts and Reflection
This week I decided to try and recreate my sketch from last black's Week 9. The week 9 sketch consists of two different noise animations:

    Aroura Waves
    Background Snow

Firstly, the Aroura will use 1D noise to determine the Y position of each vertex, aside from the first and last. The code for this will use a modified version of the code from:

 ``Non Task Files/week_04/non examples/hour_1/hour_1.pde``

The aditional parts added to the code for drawing the aroura make the wave into a closed shape, allowing it to be filled.

Secondly, for the snow, noise is used in two different ways. It is used to determine each snowflake's X and position, it's also used to determine the snowflake's initial size.