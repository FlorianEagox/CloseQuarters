class Player extends Sprite {
  int
    velX, velY, vel = 5,
    currentTrinkets = 0, maxTrinkets = 6;

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

    if(currentTrinkets < maxTrinkets) { // if trinkets are full
      Trinket toRemove = null; //a value to remove after iteration
      for(Trinket t : trinkets)
        if(intersects(this, t)) {
          toRemove = t;
          currentTrinkets++;
        }
      if(toRemove != null)
        trinkets.remove(toRemove); //remove the trinket the player colided with
    }
    //DOESN'T WORK. # of trinkets should be inverse proportional to velocity
    //vel -= currentTrinkets + 1;
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
