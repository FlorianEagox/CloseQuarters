class Door extends Sprite {
    Room nextRoom;
    public Door(int x, int y, Room nextRoom) {
        super(x, y, (Drawable) null);
        this.nextRoom = nextRoom;
        this.sizeX = 020;
        this.sizeY = 200;
    }

    @Override
    public boolean onCollision(Sprite other) {
        if (other instanceof Player)
            currentRoom = this.nextRoom;
        
        return false;
    }

    @Override
    public void draw() {
        fill(255);
        rect(this.x, this.y, this.sizeX, this.sizeY);
    }
}