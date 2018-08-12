public class Button {
    int x, y, sizeX, sizeY;
    String text;
    PImage bkg;
    public Button(int x, int y, int sizeX, int sizeY, String text, PImage bkg) {
        this.x = x;
        this.y = y;
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.text = text;
        this.bkg = bkg;
    }
    public void draw() {
        rect(x, y, sizeX, sizeY);
        image(bkg, x, y, sizeX, sizeY);
        fill(#ff0000);
        textSize(100);
        text(text, x, y, x + sizeX, y + sizeY);
        
    }
    public void tick() {

    }
    public boolean mouseInside() {
        return ((mouseX >= x && mouseX <= x + sizeX) &&
            (mouseY >= y && mouseY <= y + sizeY)
        );
    }
}