public class Menu {
    Button btnPlay;
    Button btnExit;
    int btnSizeX = 350;
    int btnSizeY = 100;
    int btnSpaceY = 200;
    PImage btnBkg;
    public Menu() {
        btnBkg = loadImage("assets/ui/btn.png");
        btnPlay = new Button((width - btnSizeX) / 2, (height - btnSizeY) / 2, btnSizeX, btnSizeY, "PLAY", btnBkg);
        btnExit = new Button((width - btnSizeX) / 2, (height - btnSizeY) / 2 + btnSpaceY, btnSizeX, btnSizeY, "EXIT", btnBkg);
    }
    public void draw() {
        fill(#ff00ff);
        text("Close Quarters", 0, 200);
        btnPlay.draw();
        btnExit.draw();
    }
    public void tick() {
        btnPlay.tick();
        btnExit.tick();
    }
    public void mouseClicked() {
        if(btnPlay.mouseInside())
            game = new Game();
            playstate = PlayState.PLAYING;
        if(btnExit.mouseInside())
            exit();
    }
    public void mousePressed() {
        
    }
}
