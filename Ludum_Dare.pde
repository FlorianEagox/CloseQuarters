Player player;
Trinket trinket;
void setup() {
  size(640, 480);
  player = new Player(10, 10);
  trinket = new Trinket(100, 100);
}
void draw() {
  background(#000000);
  tick();
  player.draw();
  trinket.draw();
}
void keyPressed() {
  player.input();
}
void tick() {
  player.tick();
  trinket.tick();
}
