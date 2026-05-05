public class Player{
    float[] playerDimensions;
    float[] playerXConstraints;
    // [0] is left move, [1] is right move
    boolean[] playerMovement = {true, true};
    float[] playerPosition;
  
    int score = 0;

    int direction = 0; // -1 is left, 0 is static, 1 is right
    float speed = 5; // multiplier used in movement
    
    void update(){
        move();
        drawPlayer();
    }

    public void move(){
        checkConstraints();

        // do movement
        if (keyCode == LEFT && playerMovement[0] == true){
            direction = -1;
        }
        else if (keyCode == RIGHT && playerMovement[1] == true){
            direction = 1;
        }
        
        if (keyPressed == false){
            direction = 0;
        }
        
        playerPosition[0] += direction * speed;
    }

    public void checkConstraints(){
        for (int x = 0; x < playerXConstraints.length; x++){
            if (x == 0 && (playerPosition[0]-(playerDimensions[0]/2)) <= playerXConstraints[x]){
                playerPosition[0] = playerXConstraints[x]+(playerDimensions[0]/2);
            }
            
            if (x == 1 && (playerPosition[0]+(playerDimensions[0]/2)) >= playerXConstraints[x]){
                playerPosition[0] = playerXConstraints[x]-(playerDimensions[0]/2);
            }
        }
        
        println(playerMovement);
    }

    public void drawPlayer(){
    //rect(player.playerPosition[0] - (player.playerDimensions[0]/2), player.playerPosition[1], player.playerPosition[0] + (player.playerDimensions[0]/2), player.playerPosition[1] + player.playerDimensions[1]);
    
    square(player.playerPosition[0]-(player.playerDimensions[1]/2), player.playerPosition[1], player.playerDimensions[1]);
}
}
