abstract class Sprite {
    int x, y,
    height, width;
    PImage img;
    public Sprite(int x, int y, String path) {
      this.x = x;
      this.y = y;
      img = loadImage("assets/" + path);
      this.width = img.width;
      this.height = img.height;
    }
    public Sprite(int x, int y, String path, int width, int height) {
      this(x, y, path);
      this.width = width;
      this.height = height;
    }
    void tick() {
      
    }
    void draw() {
        image(img, x, y, height, width);
    }
}
