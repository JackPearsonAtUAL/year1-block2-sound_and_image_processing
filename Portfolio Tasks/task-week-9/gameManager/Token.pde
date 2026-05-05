class Token{
    float[] startPos;
    float[] position = startPos;

    int speed = 1;
    int value;

    void setup(float[] sp){
        startPos = sp;
    }

    void update(){
        move();
        drawToken();
    }

    void drawToken(){
        if (value == 1){
            square(position[0]/2, position[1]/2, 5);
        }

        if (value == 5){
            circle(position[0]/2, position[1]/2, 5);
        }
    }

    void move(){
        if (value == 1){
            position[1] -= speed;
        }
        if (value == 5){
            position[1] -= speed * 2;
        }
        
    }
}