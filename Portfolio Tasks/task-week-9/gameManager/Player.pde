import java.awt.geom.*;

public class Player{
    float[] dim; // Player dimensions
    float[] con; //player x axis Constraints
    Rectangle2D.Float r;

    // [0] is left move, [1] is right move
    boolean[] playerMovement = {true, true};
    float[] pos; // player position

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
        
        pos[0] += direction * speed;
    }

    public void checkConstraints(){
        for (int x = 0; x < con.length; x++){
            if (x == 0 && (pos[0]-(dim[0]/2)) <= con[x]){
                pos[0] = con[x]+(dim[0]/2);
            }
            
            if (x == 1 && (pos[0]+(dim[0]/2)) >= con[x]){
                pos[0] = con[x]-(dim[0]/2);
            }
        }
    }

    public void drawPlayer(){ 
        fill(255);
        r = new Rectangle2D.Float((pos[0] - (dim[0]/2)), (pos[1]), (dim[0]), (dim[1]));
        rect((pos[0] - (dim[0]/2)), (pos[1]), (dim[0]), (dim[1]));
    }
}
