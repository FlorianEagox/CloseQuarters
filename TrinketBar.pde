public class TrinketBar extends Drawable {
    int trinketSize = 32;
    int x = 0;
    public TrinketBar() {
        this.zIndex = 0;
    }
    @Override
    public void draw() {
        x = width - player.maxTrinkets * trinketSize;

        fill(#660000);
        rect(x, height - trinketSize, player.maxTrinkets * trinketSize, trinketSize);
        int currentIteration = player.maxTrinkets;
        for(TrinketTypes t : player.currentTrinkets) {
            image(loadImage("assets/trinkets/" + t.fileName + ".png"), (x - trinketSize) + currentIteration * trinketSize, height - trinketSize, trinketSize, trinketSize);
            currentIteration--;
        }
    }
}