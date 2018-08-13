public class Trinket_Chest extends Sprite {
    public Trinket_Chest(int x, int y) {
        super(x, y, "trinket chest.png");        
    }
    @Override
    public boolean onCollision(Sprite other) {
        if (other instanceof Player) {
        Player player = (Player) other;
        if (actionPressed) {
            if(player.currentTrinkets.size() != 0) {
                TrinketTypes t = player.currentTrinkets.get(player.currentTrinkets.size() - 1);
                score += t.worth;
                player.currentTrinkets.remove(player.currentTrinkets.size() - 1);
                actionPressed = false;
                return true;
            }
        }
        return false;
    }
    return false;
  }
}