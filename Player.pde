class Player {
  int x, y, velX, velY, maxVel;
  Player(int x, int y) {
     this.x = x;
     this.y = y;
  }
  void draw() {
    rect(x, y, 10, 10);
  }
  void tick() {
    if(velX >= maxVel)
      x = velX;
    if(velY >= maxVel)
      y = velY;
        
    x += velX;
    y += velY;

    if(x <= 0)
      x = 0;
    if(x >= width)
      x = width;
    if(y <= 0)
      y = 0;
    if(y >= height)
      y = height;
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
