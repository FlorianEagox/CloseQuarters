public enum DoorType {
  NORTH((1280 / 2), 0),
  SOUTH((1280 / 2), -20),
  WEST(0, (720 / 2)),
  EAST((1280 - 20), (720 / 2)),
  STAIRS((1280 / 2), (720 / 2));
  

  public int x;
  public int y;
  DoorType(int x, int y) {
    this.x = x;
    this.y = y;
  }
}