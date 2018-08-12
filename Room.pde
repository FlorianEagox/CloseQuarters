public class Room {
  ArrayList<Drawable> roomDrawables;

  public Room(/* Drawable[] myDrawables */) {
    roomDrawables = new ArrayList<Drawable>();
    // for (Drawable drawable : myDrawables) {
    //   roomDrawables.add(drawable);
    // }
  }

  public void drawablesUpdated() {
    for (int i = roomDrawables.size() - 1; i >= 0; i--) {
      if (roomDrawables.get(i).toBeRemoved) {
        roomDrawables.remove(i);
      }
    }
  }

  void draw() {
    for(Drawable d : roomDrawables)
      d.draw();

  }
  void tick() {
    boolean drawablesChanged = false;
    for(Drawable t : roomDrawables) {
      if (t instanceof Sprite) {
        Sprite sprite = (Sprite) t;
        for(Drawable j : drawables) {
          Sprite sprite2 = (Sprite) j;
          if (intersects(sprite, sprite2)) {
            if (sprite.onCollision(sprite2)) {
              drawablesChanged = true;
            }
          }
        }
        sprite.tick();
      }
    }
    if(drawablesChanged) roomDrawablesUpdated();
  }

  public void roomDrawablesUpdated() {
    for (int i = roomDrawables.size() - 1; i >= 0; i--) {
      if (roomDrawables.get(i).toBeRemoved) {
        roomDrawables.remove(i);
      }
    }
  }
}