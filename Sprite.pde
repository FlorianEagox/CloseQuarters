abstract class Sprite extends Drawable {
  Drawable drawable;
  public Sprite(int x, int y, String path) {
    this.x = x;
    this.y = y;
    Image img = new Image("assets/" + path);
    this.sizeX = img.sizeX;
    this.sizeY = img.sizeY;
    this.drawable = img;
  }
  public Sprite(int x, int y, String path, int sizeX, int sizeY) {
    this(x, y, path);
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }
  public void tick() {}

  @Override
  public void draw() {
    drawable.copyPosData(this);
    drawable.draw();
    this.tick();
  }
}
