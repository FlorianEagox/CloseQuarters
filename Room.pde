public class Room {
  ArrayList<Drawable> roomDrawables;
  PImage objectLayer;
  int waterRadius = 0;
  int maxWater = 2750;
  WaterDirection direction = WaterDirection.WEST;
  boolean waterActive = true;
  PImage bkg;
  public Room(String name) {
    roomDrawables = new ArrayList<Drawable>();
    int px = width/2;
    int py = height/2;
    if(name != "deck") {
      objectLayer = loadImage("assets/rooms/" + name + " objectLayer.png");
      objectLayer.loadPixels();
      for(int i : findPixels(objectLayer, #ffffff)) {
        int x = i % 1280;
        int y = floor(i / 1280);
        roomDrawables.add(new Trinket(x, y, TrinketTypes.COINS));
      }
    }
    bkg = loadImage("assets/" + (name == "deck" ? "deck" : "floor") + ".png");
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
      ellipse(direction.x, direction.y, waterRadius, waterRadius);
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
            if (intersects(sprite, sprite2) && actionPressed) {
              if (sprite.onCollision(sprite2)) {
                drawablesChanged = true;
                actionPressed = false;
              }
            }
          }
        }
        sprite.tick();
      }
    }
    if(drawablesChanged) roomDrawablesUpdated();
  }

  public void waterTick() {
      if(waterActive)
        waterRadius += 1;
      //println(waterRadius);
  }

  public void roomDrawablesUpdated() {
    for (int i = roomDrawables.size() - 1; i >= 0; i--) {
      if (roomDrawables.get(i).toBeRemoved) {
        roomDrawables.remove(i);
      }
    }
    
  }
}