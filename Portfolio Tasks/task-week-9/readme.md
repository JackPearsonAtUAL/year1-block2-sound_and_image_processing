# Week 9: Vectors and movement
## Directory contents

* [code examples](./examples)

## Week 9 Task

Feel free to work in pairs (please add a comment about it in your sketch if you do).

**Make a game using all of the below:**
- at least 1 class
- at least 2 forces influencing the object movement
- at least 1 type of interaction.

Feel free to use the prompts below or use your own idea. You can also start with a sketch you developed earlier in the term - make sure to save it as a new sketch, as these are separate tasks to submit!

**Think about:**

- the theme of the game
- what types of objects / game characters you might need
- the goal of the game
- the score (if there is one)
- how does the game end?
- what are the interactions?

**Optional prompts:**

- You're a player running away from a giant space worm.
- You're a zombie and you need to collect brains to survive.
- You're a unicorn jumping from one rainbow to another.
- You collect flowers of different kinds to complete a predefined bouquet.

**Links to resources & technical references on Moodle :)**

## Controls

LArrow to move left
RArrow to move right

## Game Idea
### Concept
My program will be based on the 1982 game called "Catch 'Em". THe general idea of this game is that there are items dropping from the top of the screen. The player must move underneath the items to pick them up.

### MoSCoW Method

#### Must Have
    Left and right movement
    +1 Score token
    Timer
    Text for score, timer and game over
#### Should Have
    +5 Score token
    -1 Score token
    -5 Score token
#### Could Have
    +1 second token
    Custom Sprites
    Animations
    Music
    Player jumping
    Horizontal obsticles for player
    Horizontal layout for player
    Set levels
#### Won't Have
    Online play
    Multiplayer

## Personal Thoughts and Reflection
When I first heard we were making a game for this week, I was excited. It has been so long since I've made any sort of video game and getting to reuse my skills felt genial.

There were certainly a couple of parts which I struggled with. Namely the bits which game engines handle, i.e. collisions and movement.

To start this project, I created the player and thier movement. For the most part this was fine. It took a little bit to get the movement constraints and the movement itself working. Once I got that done, it all went smoothly.

Moving onto the tokens, this was even easier, as I had everything pretty much pre-made in the player script. All I had to do was add a variable holding the token's value and have it draw a different sprite based on the held internal score.

Now I had to make the player and tokens interact. After a little bit of googling, I came across the java.awt libraries, specifically the java.awt.geom.* library. This allows me to create shapes around the sprites, which can intersect, acting like Unity's trigger collider.

That allowed me to  increase the player's score on collision. However not the object needed to be deleted on contact. 

This was most definitely the most difficult part of the code. In Java, arrays once declared have it's length extended or shrunk. This meant I had to use an ArrayList<> to store the tokens. This wasn't too much of an issue. The problem arose from removing the object while inside a for loop.

To get around this I tried a few different methods. Most of them didn't work, however the one which did, uses an iterator. Using the Iterator allowed me to remove() a token from the list without causing an error with the indexing.

Moving on to the final requirements for the game, I have to make a timer. I could have gone around this two ways. Firstly importing another package containing a timer, or secondly using the framerate to determine time passed. I chose to go with the latter, as importing nother library would be redundant. The code for the timer is also very simple, due to processing giving the us the frame count. 

By taking the frameCount using the modulus operandi with the frameRate, when the result is 0, that means a second has passed. Therefore putting this calculation into an if condition, Every second the timer can be decreased by 1 second.

Now for the final part I needed to add text to the screen. This was very simple and not worth talking about much.