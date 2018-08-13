public class Game {
    Room[] room = new Room[9];
    Room roomDeck;
    LightMask lightMask = new LightMask();
    int previousReleased = 0, delay = 10000;
    public Game() {
        /////////////////////////////////////////////////////////////////////////////////
        // ALL THE FUCKING DOORS OH MY GOD I WANT TO DIE LET ME SLEEP PLEASE HOLY SHIT //
        /////////////////////////////////////////////////////////////////////////////////
        roomDeck = new Room("deck");
        for(int i = 0; i < room.length; i++) {
            room[i] = new Room("room" + (i + 1));
        }
        
          roomDeck.roomDrawables.add(new Door(room[2-1], DoorType.STAIRS));
          roomDeck.roomDrawables.add(new Trinket_Chest((width - 64) / 2, 200));
          room[1-1].roomDrawables.add(new Door(room[2-1], DoorType.EAST));
          room[1-1].roomDrawables.add(new Door(room[4-1], DoorType.SOUTH));
        
          room[2-1].roomDrawables.add(new Door(roomDeck, DoorType.STAIRS));
          room[2-1].roomDrawables.add(new Door(room[1-1], DoorType.WEST));
          room[2-1].roomDrawables.add(new Door(room[3-1], DoorType.EAST));
          room[2-1].roomDrawables.add(new Door(room[5-1], DoorType.SOUTH));
        
          room[3-1].roomDrawables.add(new Door(room[2-1], DoorType.WEST));
          room[3-1].roomDrawables.add(new Door(room[6-1], DoorType.SOUTH));
        
          room[4-1].roomDrawables.add(new Door(room[1-1], DoorType.NORTH));
          room[4-1].roomDrawables.add(new Door(room[5-1], DoorType.EAST));
          room[4-1].roomDrawables.add(new Door(room[7-1], DoorType.SOUTH));
        
          room[5-1].roomDrawables.add(new Door(room[2-1], DoorType.NORTH));
          room[5-1].roomDrawables.add(new Door(room[6-1], DoorType.EAST));
          room[5-1].roomDrawables.add(new Door(room[8-1], DoorType.SOUTH));
          room[5-1].roomDrawables.add(new Door(room[4-1], DoorType.WEST));
        
          room[6-1].roomDrawables.add(new Door(room[3-1], DoorType.NORTH));
          room[6-1].roomDrawables.add(new Door(room[5-1], DoorType.WEST));
          room[6-1].roomDrawables.add(new Door(room[9-1], DoorType.SOUTH));
        
          room[7-1].roomDrawables.add(new Door(room[4-1], DoorType.NORTH));
          room[7-1].roomDrawables.add(new Door(room[8-1], DoorType.EAST));
        
          room[8-1].roomDrawables.add(new Door(room[5-1], DoorType.NORTH)); // <- WATER STARTING ROOM
          room[8-1].roomDrawables.add(new Door(room[7-1], DoorType.WEST));
          room[8-1].roomDrawables.add(new Door(room[9-1], DoorType.EAST));
          room[8-1].waterActive = true;


          room[9-1].roomDrawables.add(new Door(room[8-1], DoorType.WEST));
          room[9-1].roomDrawables.add(new Door(room[6-1], DoorType.NORTH));
        
        

       ////////////////////////////////////////////////////////////////////////////////        

        currentRoom = room[2-1];
        
        player = new Player(100, 100);
        drawables.add(player);
        drawablesUpdated();
    }
    public void draw() {   
      currentRoom.draw();
      
      for(Drawable t : drawables) {
        if(t instanceof Player) {
            //translate(t.x, t.y); <-- DOESN'T WORK
            //rotate(radians(player.rotation));
        }
        t.draw();  
      }
      if (currentRoom != roomDeck) {
          lightMask.draw();
      }

    }
    public void tick() {
        println(player.currentTrinkets.size());
        boolean drawablesChanged = false;
        for(Drawable t : drawables) {
            if (t instanceof Sprite) { 
                Sprite sprite = (Sprite) t;
                for(Drawable j : drawables) {
                    if(j instanceof Sprite) {
                        Sprite sprite2 = (Sprite) j;
                        if (intersects(sprite, sprite2)) {
                            if (sprite.onCollision(sprite2)) {
                                drawablesChanged = true;
                            }
                        }
                    }
                }
                sprite.tick();
            }
            currentRoom.tick();
            if(drawablesChanged) drawablesUpdated();
        }
        for(int i = 0; i < room.length; i++) {
            room[i].waterTick();
        }
    }
    public void keyPressed() {
        player.keyPressed();
        if(key == ESC) //Clear escape so processing doesn't close game
            key = 0;
    }
    public void keyReleased() {
        player.keyReleased();
        if(key == ESC) {
            key = 0;
            drawables.clear();
            playstate = PlayState.MENU;
        } else if(key == 'f') {
            actionPressed = true;
            // previousReleased = millis();
        }
    }
}