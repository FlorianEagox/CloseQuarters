public class Trinket extends Sprite {
  public TrinketTypes type;
  public Trinket(int x, int y, TrinketTypes type) {
    super(x, y, "trinkets/" + type.fileName + ".png", 25, 25);
    this.type = type;
  }

  @Override
  public boolean onCollision(Sprite other) {
    if (other instanceof Player) {
      Player player = (Player) other;
      if (player.pickup(this.type)) {
        this.toBeRemoved = true;
        return true;
      }
      return false;
    }
    return false;
  }
}
