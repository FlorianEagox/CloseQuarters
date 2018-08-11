class Player extends Sprite {
  int velX, velY, vel = 5, maxTrinkets = 6;

  private ArrayList<TrinketTypes> currentTrinkets = new ArrayList<TrinketTypes>();

  Player(int x, int y) {
    super(x, y, "player.png", 50, 50);
    this.zIndex = 1;
  }

  @Override
  public void tick() {
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
    //DOESN'T WORK. # of trinkets should be inverse proportional to velocity
    //vel -= currentTrinkets + 1;
  }

  boolean pickup(TrinketTypes trinket) {
    if (currentTrinkets.size() >= maxTrinkets) return false;
    currentTrinkets.add(trinket);
    return true;
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
