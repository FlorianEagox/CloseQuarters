abstract class Sprite {
    int x, y,
    sizeX, sizeY;
    PImage img;
    public Sprite(int x, int y, String path) {
      this.x = x;
      this.y = y;
      img = loadImage("assets/" + path);
      sizeX = img.width;
      sizeY = img.height;
    }
    public Sprite(int x, int y, String path, int sizeX, int sizeY) {
      this(x, y, path);
      this.sizeX = sizeX;
      this.sizeY = sizeY;
    }
    void tick() {
      
    }
    void draw() {
        image(img, x, y, sizeX, sizeY);
    }
}
