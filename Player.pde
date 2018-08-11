class Player extends Sprite {
  int
    velX, velY, maxVel,
    weight = 0, maxWeight = 30;
  Player(int x, int y) {
    super(x, y, "player.png");
  }
  void draw() {
    super.draw();
  }
  void tick() {
    if(velX >= maxVel)
      x = velX;
    if(velY >= maxVel)
      y = velY;
        
    x += velX;
    y += velY;

    //Keep Player in range
    if(x <= 0)
      x = 0;
    if(x >= width)
      x = width;
    if(y <= 0)
      y = 0;
    if(y >= height)
      y = height;
    
    for(Trinket t : trinkets) {
      if(intersects(this, t))
        print("intersex!");
    }
  }
  
  void input() {
    switch(key) {
      case 'w':
        velY--;
        break;
      case 's':
        velY++;
        break;
      case 'a':
        velX--;
        break;
      case 'd':
        velX++;
        break;
    }
  }
}
