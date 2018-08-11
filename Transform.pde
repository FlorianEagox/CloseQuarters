public class Transform {
    public int x = 0;
    public int y = 0;
    public int sizeX = 0;
    public int sizeY = 0;

  public void copyPosData(Transform transform) {
    this.x = transform.x;
    this.y = transform.y;
    this.sizeX = transform.sizeX;
    this.sizeY = transform.sizeY;
  }
}