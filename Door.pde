class Door extends Sprite {
    Room nextRoom;
    DoorType type;
    public Door(Room nextRoom, DoorType type) {
        super(0, 0, (Drawable) null);
        this.nextRoom = nextRoom;
        this.type = type;

        if(type == DoorType.STAIRS) {
            x = width / 2;
            y = height / 2;
            this.img = new Image("assets/stairs.png");
            this.sizeX = img.sizeX * 2;
            this.sizeY = img.sizeY * 2;
            this.drawable = img;
        } else {
            this.sizeX = 20;
            this.sizeY = 200;
            x = type.x;
            y = type.y;
        }
    }

    @Override
    public boolean onCollision(Sprite other) {
        if (other instanceof Player && actionPressed) {
            currentRoom = this.nextRoom;
            switch(type) {
              case NORTH:
                player.x = width / 2;
                player.y = height - player.sizeY;
                break;
              case SOUTH:
                println("gone");
                player.x = width / 2;
                player.y = 0 + player.sizeY;
                break;
              case EAST:
                player.x = player.sizeX;
                player.y = height / 2;
                break;
              case WEST:
                player.x = width - player.sizeX;
                player.y = height / 2;
                break;
            }
            actionPressed = false;
        }
        
        return false;
    }

    @Override
    public void draw() {
        fill(255);
        if(type != DoorType.STAIRS) {
            if(type == DoorType.SOUTH || type == DoorType.NORTH) {
                this.sizeX = 200;
                this.sizeY = 20;
            }
            if(type == DoorType.SOUTH) {
                x = (width - sizeX) / 2;
                y = height - sizeY;
            }
            if(type == DoorType.NORTH) {
                x = (width - sizeX) / 2;
                y = 0;
            }

            rect(this.x, this.y, this.sizeX, this.sizeY);
        } else
            super.draw();
    }
}
