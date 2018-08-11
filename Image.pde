public class Image extends Drawable {
  PImage theImage;
  public Image(String path) {
    theImage = loadImage(path);
    this.sizeX = theImage.width;
    this.sizeY = theImage.height;
  }

  @Override
  public void draw() {
    image(this.theImage, this.x, this.y, this.sizeX, this.sizeY);
  }
}