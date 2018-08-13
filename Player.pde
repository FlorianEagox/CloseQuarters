class Player extends Sprite {
  int velX, velY, vel = 5, maxTrinkets = 5;
  AnimationState animation = AnimationState.IDLE;
  private ArrayList<TrinketTypes> currentTrinkets = new ArrayList<TrinketTypes>();
  float rotation = 0f;
  private ArrayList<Image> animations = new ArrayList<Image>();
  boolean walking;
  int delay = 500;
  int previousTime = 0;
  int currentFrame = 0;
  
  int health = 10;

  Player(int x, int y) {
    super(x, y, "player/idle.png", 75, 75);
    this.zIndex = 1;
    for(int i = 1; i <= 5; i++) {
      animations.add(new Image("assets/player/walk " + i + ".png"));
    }
  }

  @Override
  public void tick() {
    x += velX;
    y += velY;

    switch(animation) {
      case UP:
        rotation = 0f;
        break;
      case DOWN:
        rotation = 180f;
        break;
      case LEFT:
        rotation = 270f;
        break;
      case RIGHT:
        rotation = 90f;
        break;
    }
    if(animation != AnimationState.IDLE) {
      if(millis() - previousTime >= delay) {
        if(currentFrame >= animations.size())
          currentFrame = 0;
        drawable = animations.get(currentFrame);
        currentFrame++;
        previousTime = millis();
      }
    }
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
    if(currentRoom.waterActive) {
      int centerX = currentRoom.direction.x;
      int centerY = currentRoom.direction.y;
      int radius = currentRoom.waterRadius;
      float distance = sqrt(pow(x - centerX, 2) + pow(y - centerY, 2));
      if(distance <= radius)
        gameOver = new GameOver();
        playstate = PlayState.GAME_OVER;
    }
  }

  boolean pickup(TrinketTypes trinket) {
    if (currentTrinkets.size() >= maxTrinkets || !actionPressed) return false;
      currentTrinkets.add(trinket);
    return true;
  }
  
  void keyPressed() {
    switch(key) {
      case 'w':
        velY = -vel;
        animation = AnimationState.UP;
        break;
      case 's':
        velY = vel;
        animation = AnimationState.DOWN;
        break;
      case 'a':
        velX = -vel;
        animation = AnimationState.LEFT;
        break;
      case 'd':
        velX = vel;
        animation = AnimationState.RIGHT;
        break;
    }
  }
  void keyReleased() {
    switch(key) {
      case 'w':
        velY = 0;
        break;
      case 's':
        velY = 0;
        break;
      case 'a':
        velX = 0;
        break;
      case 'd':
        velX = 0;
        break;
    }
    animation = AnimationState.IDLE;
  }
}