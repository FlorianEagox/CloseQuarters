public class LightMask extends Drawable {
    int px, py; 
    float offsetAngle = 0f;
    float widthAngle = 30f;
    PImage img;
    public LightMask() {
        img = createImage(width, height, ARGB);
      
    }
    @Override
    void draw() {
        px = player.x;
        py = player.y;
        offsetAngle = (float) Math.toDegrees(atan2(py - mouseY, px - mouseX));
        background(255);
        img.loadPixels();
        for (int i = 0; i < img.pixels.length; i++) {
            int x = i % 1280;
            int y = floor(i / 1280);
            float dist = sqrt(pow(px - x, 2) + pow(py - y, 2));
            float angle = (float) Math.toDegrees(atan2(py - y, px - x)) - (offsetAngle - (widthAngle / 3));
            img.pixels[i] = color(0, 0, 0, 255);
            if (angle <= widthAngle && angle >= 0 && dist <= 50) {
                float angleN = abs((angle / (widthAngle / 2f)) - 1);
                float distN = dist / 50f;
                img.pixels[i] = color(0, 0, 0, min(angleN*angleN*255, (distN*(2-distN))*255));
            } else if (angle <= widthAngle && angle >= 0) {
                float angleN = abs((angle / (widthAngle / 2f)) - 1);
                img.pixels[i] = color(0, 0, 0, angleN*angleN*255);
            } else  if (dist <= 50) {
                float distN = dist / 50f;
                img.pixels[i] = color(0, 0, 0, (distN*(2-distN))*255);
            }
        }
        img.updatePixels();
        image(img, 0, 0);
    }
}