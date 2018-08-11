abstract class Sprite {
    int x, y;
    PImage img;
    public Sprite(int x, int y, String path) {
      this.x = x;
      this.y = y;
      img = loadImage(path);
    }
    void tick() {
      
    }
    void draw() {
      image(img, x, y);
    }
}
