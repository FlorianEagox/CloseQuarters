import java.util.*;

Player player;
/* 
*  The trinkets and cracks stuff needs to be moved to the Room class. There will
*  be many subclasses of Room. These will be the different rooms in the ship.
*  Instances of which will be stored in this main file. I have yet to figure out
*  how we are going to deal with room switching, but I think there will be a
*  door class that will switch rooms on collision with the player. 
*/ 
ArrayList<Drawable> drawables = new ArrayList<Drawable>();

void setup() {
  size(1280, 720);
  player = new Player(100, 100);
  drawables.add(player);
  drawables.add(new Trinket(300, 300, TrinketTypes.COINS));
  drawables.add(new Trinket(251, 237, TrinketTypes.COINS));
  drawables.add(new Trinket(142, 425, TrinketTypes.COINS));
  drawables.add(new Trinket(662, 127, TrinketTypes.COINS));
  drawables.add(new Trinket(1000, 600, TrinketTypes.COINS));
  drawables.add(new Trinket(100, 644, TrinketTypes.COINS));
  drawables.add(new Trinket(1100, 327, TrinketTypes.COINS));
  drawables.add(new Crack(300, 600));
  drawables.add(new Crack(600, 200));
  drawablesUpdated();
  
}
void draw() {
  background(#000000);
  tick();

  for(Drawable t : drawables)
    t.draw();
}
void keyPressed() {
  player.keyPressed();
}
void keyReleased() {
  player.keyReleased();
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

void drawablesUpdated() {
  for (int i = drawables.size() - 1; i >= 0; i--) {
    if (drawables.get(i).toBeRemoved) {
      drawables.remove(i);
    }
  }
  Collections.sort(drawables, new Comparator<Drawable>() {
    @Override
    public int compare(Drawable lhs, Drawable rhs) {
        return lhs.zIndex > rhs.zIndex ? 1 : (lhs.zIndex < rhs.zIndex) ? -1 : 0;
    }
  });
}

boolean intersects(Sprite a, Sprite b) { // if a or b's x and y choords call within eachother's bounds.
  return (a.x < b.x + b.sizeX && a.x + a.sizeX > b.x && a.y < b.y + b.sizeY && a.y + a.sizeY > b.y);
}