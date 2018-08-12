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
  public Sprite(int x, int y, Drawable drawable) {
    this.x = x;
    this.y = y;
    if (drawable != null) {
      this.sizeX = drawable.sizeX;
      this.sizeY = drawable.sizeY;
      this.drawable = drawable;
    }
  }

  public Sprite(int x, int y, Drawable drawable, int sizeX, int sizeY) {
    this(x, y, drawable);
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }

  public void tick() {}

  public boolean onCollision(Sprite other) {
    return false;
  }

  @Override
  public void draw() {
    if (this.drawable != null) {
      drawable.copyPosData(this);
      drawable.draw();
    }
    this.tick();
  }
}
