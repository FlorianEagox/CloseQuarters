public class Room {
  ArrayList<Drawable> roomDrawables;
  PImage objectLayer;
  int waterRaidus = 0;
  WaterDirection direction = WaterDirection.WEST;
  boolean waterActive = true;
  PImage bkg;
  public Room(String name /* Drawable[] myDrawables */) {
    roomDrawables = new ArrayList<Drawable>();
    // for (Drawable drawable : myDrawables) {
    //   roomDrawables.add(drawable);
    // }
    objectLayer = loadImage("assets/rooms/" + name + " objectLayer.png");
    objectLayer.loadPixels();
    int px = width/2;
    int py = height/2;
    for (int i = 0; i < objectLayer.pixels.length; i++) {
      int x = i % 1280;
      int y = floor(i / 1280);
      if(((color)objectLayer.get(x, y)) == #ffffff)
        roomDrawables.add(new Trinket(x, y, TrinketTypes.COINS));
    }
    bkg = loadImage("assets/floor.png");
  }

  public void drawablesUpdated() {
    for (int i = roomDrawables.size() - 1; i >= 0; i--)
      if (roomDrawables.get(i).toBeRemoved)
        roomDrawables.remove(i);
  }

  void draw() {
    image(bkg, 0, 0);
    if(waterActive) {
      fill(#40a4df);
      ellipse(direction.x, direction.y, waterRaidus, waterRaidus);
    }
    
    for(Drawable d : roomDrawables)
      d.draw();
  }
  void tick() {
    boolean drawablesChanged = false;
    for(Drawable t : roomDrawables) {
      if (t instanceof Sprite) {
        Sprite sprite = (Sprite) t;
        for(Drawable j : drawables) {
          if(j instanceof Sprite) {
            Sprite sprite2 = (Sprite) j;
            if (intersects(sprite, sprite2)) {
              if (sprite.onCollision(sprite2)) {
                drawablesChanged = true;
              }
            }
          }
        }
        sprite.tick();
      }
    }
    if(drawablesChanged) roomDrawablesUpdated();
  
    if(waterActive)
      waterRaidus += 1;
  }

  public void roomDrawablesUpdated() {
    for (int i = roomDrawables.size() - 1; i >= 0; i--) {
      if (roomDrawables.get(i).toBeRemoved) {
        roomDrawables.remove(i);
      }
    }
    
  }
}