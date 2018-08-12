public enum WaterDirection {
  NORTH((1280 / 2), 0),
  SOUTH((1280 / 2), 720),
  WEST(0, (720 / 2)),
  EAST(1280, (720 / 2));
  
  

  public int x;
  public int y;
  WaterDirection(int x, int y) {
    this.x = x;
    this.y = y;
  }
}