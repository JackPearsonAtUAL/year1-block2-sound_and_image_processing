import java.util.ArrayList;
import java.util.Iterator;
import java.awt.geom.*;
import java.time.LocalTime;

public Player player = new Player();
public ArrayList<Token> tokens = new ArrayList<Token>(0);
public int score = 0;

public int timeLimit = 30; // Time limit in seconds
public int timeLeft;
boolean gameRunning;
boolean endTextDisplay = false;
int frames;

void setup(){
    gameRunning = true;
    timeLeft = timeLimit;
    colorMode(RGB);
    size(800, 500);
    frameRate(60);
    frames = int(frameRate);

    textSize(20); 

    
    player.dim = new float[]{30, 30};
    
    player.con = new float[]{0+20, width-20};
    
    player.pos = new float[]{width/2, height-(50+player.dim[1])};
    
    drawScene();
    println(frames);
}

void draw(){  
    if (timeLeft > 0){
        if (frameCount % frames == 0){
            timeLeft -= 1;
        }

        drawScene();
        
        genToken();

        player.update();
        // Player collider = player.r

        for (Iterator<Token> i = tokens.iterator(); i.hasNext();){
            Token t = i.next();
            t.update();

            // Square token collider logic
            if ((t.value == 1 || t.value == -1) && t.r.intersects(player.r)){
                score += t.value;
                println(score);
                i.remove();
            }
            // Elliptical token collider logic
            else if ((t.value == 5 || t.value == -5) && t.e.intersects(player.r)){
                score += t.value;
                println(score);
                i.remove();
            } 
        } 

        fill(0);
        text("Time "+ timeLeft, 20, 480);
        text("Score "+ score, 200, 480);
    }
    if (!endTextDisplay && timeLeft == 0){
        endTextDisplay = true;
        fill(128, 0, 0);
        textSize(64); 
        textAlign(CENTER);
        text("Game Finished", width/2, height/2);
    }

}

void drawScene(){
    background(128);

    fill(255);
    rect(0, height-(height/10), width, height);
}

void genToken(){
    int i = intGen(0);
    if (i == 1){
        Token t = new Token();
        i = intGen(2);
        if(i <10){
            t.value = 1;
        }
        else if (10 <= i && i < 16){
            t.value = 5;
        }
        else if (16 <= i && i < 19){
            t.value = -1;
        }
        else if (19 <= i){
            t.value = -5;
        }
        t.position = new float[]{map(intGen(0), 0, 100, 10, width - 20), 0};
        tokens.add(t);
    }
}

// Get random int
int intGen(int k){
    if (k == 0){
        return (int)(Math.random() * 101); 
    }
    if (k == 1){
        return (int)(Math.random() * 101)/10; 
    }
    if (k == 2){
        return (int)(Math.random() * 101)/5;
    }
    return 0;
}

boolean endGame(){
    return gameRunning = false;
}
