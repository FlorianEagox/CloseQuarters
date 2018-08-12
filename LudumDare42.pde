import java.util.*;
Room currentRoom;
Room newRoom;
Player player;
PlayState playstate;
Menu menu;
Game game;
ArrayList<Drawable> drawables = new ArrayList<Drawable>();

void setup() {
  playstate = PlayState.MENU;
  size(1280, 720);
  menu = new Menu();
}

void draw() {
  background(#000000);
  tick();
  switch(playstate) {
    case MENU:
      menu.draw();
      break;
    case PLAYING:
      game.draw();
      break;
  }
}

void tick() {
  switch(playstate) {
    case MENU:
      menu.tick();
      break;
    case PLAYING:
      game.tick();
      break;
  }
}

//EVENTS

void keyPressed() {
  if(playstate == PlayState.PLAYING)
    game.keyPressed();
}
void keyReleased() {
  if(playstate == PlayState.PLAYING)
    game.keyReleased();
}

void mouseClicked() {
  if(playstate == PlayState.MENU)
    menu.mouseClicked();
}
void mousePressed() {
  if(playstate == PlayState.MENU)
    menu.mousePressed();
}

//UTILS

void drawablesUpdated() {
  currentRoom.roomDrawablesUpdated();
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
boolean intersectsCircle(Sprite a, int x, int y, int radius) {
  return(x + radius >= a.x &&
    y + radius >= a.y &&
    x - radius <= a.x + a.sizeX &&
    y - radius <= a.y + a.sizeY);
}
int[] findPixels(PImage img, color c) {
  ArrayList<Integer> pixelsFound = new ArrayList<Integer>();
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
      if(img.pixels[i] == c) {
        pixelsFound.add(i);
      }
  }
  int[] pixelsFoundArray = new int[pixelsFound.size()];
  for (int i = 0; i < pixelsFound.size(); i++) {
    pixelsFoundArray[i] = (int) pixelsFound.get(i);
  } 
  return pixelsFoundArray;
}