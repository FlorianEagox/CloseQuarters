public class Trinket extends Sprite {
  public TrinketTypes type;
  public Trinket(int x, int y, TrinketTypes type) {
    super(x, y, "trinkets/" + type.fileName + ".png", 25, 25);
    this.type = type;
  }
}
