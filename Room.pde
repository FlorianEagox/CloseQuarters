public class Room {

    ArrayList<Drawable> roomDrawables;

    public Room() {
        roomDrawables = new ArrayList<Drawable>();
    }
    void draw() {
        for(Drawable d : roomDrawables)
            d.draw();

    }
    void tick() {
        boolean drawablesChanged = false;
  for(Drawable t : drawables) {
    if (t instanceof Sprite) {
      Sprite sprite = (Sprite) t;
      sprite.tick();
    }
    if (t instanceof Trinket) {
      Trinket trinket = (Trinket) t;
      if (intersects(trinket, player)) {
        if (player.pickup(trinket.type)) {
          trinket.toBeRemoved = true;
          drawablesChanged = true;
        }
      }
    }
  }
  if(drawablesChanged) drawablesUpdated();

    }
}