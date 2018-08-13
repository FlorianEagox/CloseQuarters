public class Room {
  ArrayList<Drawable> roomDrawables;
  PImage objectLayer;
  int waterRadius = 0;
  int maxWater = 3000;
  WaterDirection direction = WaterDirection.SOUTH;
  boolean waterActive = false;
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
    fill(#40a4df);
    ellipse(direction.x, direction.y, waterRadius, waterRadius);
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
        waterRadius++;
      if(waterRadius >= maxWater) {
        waterActive = false;
        for(Drawable d : roomDrawables) {
          if(d instanceof Door) {
            Door door = (Door) d;
            Room room = door.nextRoom;
            room.waterActive = true;
            switch(door.type) {
              case NORTH:
                room.direction = WaterDirection.SOUTH;
                break;
              case EAST:
                room.direction = WaterDirection.WEST;
                break;
              case SOUTH:
                room.direction = WaterDirection.NORTH;
                break;
              case WEST:
                room.direction = WaterDirection.EAST;
                break;
            }
          }
        }
      }
  }

  public void roomDrawablesUpdated() {
    for (int i = roomDrawables.size() - 1; i >= 0; i--) {
      if (roomDrawables.get(i).toBeRemoved) {
        roomDrawables.remove(i);
      }
    }
    
  }
}