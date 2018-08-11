Player player;
ArrayList<Trinket> trinkets = new ArrayList<Trinket>();

void setup() {
  size(640, 480);
  player = new Player(10, 10);
  trinkets.add(new Trinket(300, 300));
}
void draw() {
  background(#000000);
  tick();
  player.draw();
  for(Trinket t : trinkets)
    t.draw();
}
void keyPressed() {
  player.keyPressed();
}
void keyReleased() {
  player.keyReleased();
}
void tick() {

player.tick();
for(Trinket t : trinkets)
    t.tick();
}


boolean intersects(Sprite a, Sprite b) { // if a or b's x and y choords call within eachother's bounds.
  return (a.x < b.x + b.sizeX && a.x + a.sizeX > b.x && a.y < b.y + b.sizeY && a.y + a.sizeY > b.y);
}