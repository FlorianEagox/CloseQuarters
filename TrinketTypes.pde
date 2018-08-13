public enum TrinketTypes {
  COINS("coins", 0.50f),
  locket("locket", 1.5f);

  public String fileName;
  public float worth;
  TrinketTypes(String fileName, float worth) {
    this.fileName = fileName;
    this.worth = worth;
  }
}