class Door extends Sprite {
    Room nextRoom;
    public Door(int x, int y, Room nextRoom) {
        super(x, y, "door.png");
        this.nextRoom = nextRoom;
    }
    void colision() {
        currentRoom = nextRoom;
    }
}