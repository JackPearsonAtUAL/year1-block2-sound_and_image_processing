public Player player = new Player();
public Token[] tokens;
public int score = 0;

void setup(){
    size(800, 500);
    
    player.playerDimensions = new float[]{10, 30};
    
    player.playerXConstraints = new float[]{0+(player.playerDimensions[0] / 2), width-(player.playerDimensions[0] / 2)};
    
    player.playerPosition = new float[]{width/2, height-(50+player.playerDimensions[1])};
    
    drawScene();
}

void draw(){  
    drawScene();
    player.update();
}

void drawScene(){
    background(128);
    rect(0, height-(height/10), width, height);
}

void genToken(){
    int i = (int)(Math.random() * 101);
    i /= 10;
    if (i == 1){
        
    }
}
