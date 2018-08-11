Player player;
ArrayList<Trinket> trinkets = new ArrayList<Trinket>();

void setup() {
  size(640, 480);
  player = new Player(10, 10);
  trinkets.add(new Trinket(100, 100));
}
void draw() {
  background(#000000);
  tick();
  player.draw();
  for(Trinket t : trinkets)
    t.draw();
}
void keyPressed() {
  player.input();
}
void tick() {
  player.tick();
  for(Trinket t : trinkets)
    t.tick();
}
