class Player{
    float[] playerDimensions = {10, 30};
    float[] playerXConstraints = {0+(playerDimensions[0]/2), width-(playerDimensions[0]/2)};
  
    int score = 0;

    int direction = 0; // -1 is left, 0 is static, 1 is right
    float speed = 2; // multiplier used in movement

    public void move(){
        return;
    }
}
