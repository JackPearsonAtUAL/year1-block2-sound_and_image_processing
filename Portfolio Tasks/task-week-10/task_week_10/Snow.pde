class Snow{
    PVector position;
    PVector velocity;
    PVector acceleration;
    public float size;


    void update(){  
        fill(255);
        velocity.add(acceleration);
        position.add(velocity);

        position.x += map((float)Math.random(), 0, 1, -1, 1);

        circle(position.x, position.y, size);
    }
}
        
