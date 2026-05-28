class Snow{
    float[] position;
    int speed = 2;
    public float size;


    void update(float frames){  
        fill(255);

        position[0] += map((float)Math.random(), 0, 1, -1, 1);

        position[1] += speed;

        circle(position[0], position[1], size);
    }
}
        
