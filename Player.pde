class Player extends Sprite {
  int
    velX, velY, vel = 6,
    weight = 0, maxWeight = 30;

  Player(int x, int y) {
    super(x, y, "player.png");
  }
  void draw() {
    super.draw();
  }
  void tick() {
    
        
    x += velX;
    y += velY;

    //Keep Player in range
    if(x <= 0)
      x = 0;
    if(x >= width - sizeX)
      x = width - sizeX;
    if(y <= 0)
      y = 0;
    if(y >= height - sizeY)
      y = height - sizeY;
    
    Trinket toRemove = null;
    for(Trinket t : trinkets)
      if(intersects(this, t))
        toRemove = t;
    if(toRemove != null)
      trinkets.remove(toRemove);
  }
  
  void keyPressed() {
    switch(key) {
      case 'w':
        velY = -vel;
        break;
      case 's':
        velY = vel;
        break;
      case 'a':
        velX = -vel;
        break;
      case 'd':
        velX = vel;
        break;
    }
  
  
  
  }
  void keyReleased() {
    switch(key) {
      case 'w':
      case 's':
        velY = 0;
        break;
      case 'a':
      case 'd':
        velX = 0;
        break;
    }
  }
}
