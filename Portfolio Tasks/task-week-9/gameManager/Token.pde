import java.awt.geom.*;

class Token{
    float[] position;
    Rectangle2D.Float r;
    Ellipse2D.Float e;

    int speed = 2;
    int value;

    void update(){
        move();
        drawToken();
    }

    void drawToken(){
        if (value == 1){
            r = new Rectangle2D.Float(position[0], position[1], 10, 10);

            float x = (float) r.getX();
            float y = (float) r.getY();
            float w = (float) r.getWidth();
            float h = (float) r.getHeight();
            
            fill(255);
            rect(x, y, w, h);
        }

        if (value == 5){
            e = new Ellipse2D.Float(position[0], position[1], 10, 10);
                        
            float x = (float) e.getX();
            float y = (float) e.getY();
            float w = (float) e.getWidth();
            float h = (float) e.getHeight();
            fill(255);
            ellipse(x, y, w, h);
        }

        if (value == -1){
            r = new Rectangle2D.Float(position[0], position[1], 10, 10);

            float x = (float) r.getX();
            float y = (float) r.getY();
            float w = (float) r.getWidth();
            float h = (float) r.getHeight();
            fill(255,0,0);
            rect(x, y, w, h);
        }

        if (value == -5){
            e = new Ellipse2D.Float(position[0], position[1], 10, 10);
                        
            float x = (float) e.getX();
            float y = (float) e.getY();
            float w = (float) e.getWidth();
            float h = (float) e.getHeight();

            fill(255,0,0);
            ellipse(x, y, w, h);
        }
    }

    void move(){
        if (value == 1 || value == -1){
            position[1] += speed;
        }
        if (value == 5 || value == -5){
            position[1] += speed * 2;
        }
        
    }
}
