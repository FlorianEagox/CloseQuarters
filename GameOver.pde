public class GameOver {
    int btnSizeX = 350;
    int btnSizeY = 100;
    int btnSpaceY = 200;

    Button btnPlayAgain, btnExit;
    PImage btnBkg;
    
    public GameOver() {
        btnBkg = loadImage("assets/ui/btn.png");
        btnPlayAgain = new Button((width - btnSizeX) / 2, (height - btnSizeY) / 2, btnSizeX, btnSizeY, "Play Again!", btnBkg);
        btnExit = new Button((width - btnSizeX) / 2, (height - btnSizeY) / 2 + btnSpaceY, btnSizeX, btnSizeY, "EXIT", btnBkg);
    }
    public void draw() {
        textSize(40);
        text("Game over! Better Luck Next time!!!\n Your score was " + score * 100, 100, 100);
        btnPlayAgain.draw();
        btnExit.draw();
    }
    public void tick() {
        btnPlayAgain.tick();
        btnExit.tick();
    }  
    public void mouseClicked() {
        if(btnPlayAgain.mouseInside()) {
            game = new Game();
            playstate = PlayState.PLAYING;
        }
        if(btnExit.mouseInside())
            exit();   
    }
}