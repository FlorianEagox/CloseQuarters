import java.awt.geom.Point2D;
import java.awt.geom.Line2D;
import java.awt.geom.Rectangle2D;

public class LightMask extends Drawable {
  int px, py; 
  float offsetAngle = 0f;
  float widthAngle = 30f;
  int auraRadius = 200;
  int prevPX = 0;
  int prevPY = 0;
  int prevMX = 0;
  int prevMY = 0;
  Rectangle2D windowRect;

  PImage img;
  public LightMask() {
    img = createImage(width, height, ARGB);
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
        img.pixels[i] = color(0, 0, 0, 255);
    }
    img.updatePixels();
    windowRect = new Rectangle2D.Double(0, 0, 1280, 720);
  }
  @Override
  void draw() {
    px = player.x + player.sizeX/2;
    py = player.y + player.sizeY/2;



    // for (int i = 0; i < img.pixels.length; i++) {
    //     int x = i % 1280;
    //     int y = floor(i / 1280);
    //     float dist = sqrt(pow(px - x, 2) + pow(py - y, 2));
    //     float angle = (float) Math.toDegrees(atan2(py - y, px - x)) - (offsetAngle - (widthAngle / 3));
    //     if (!(angle <= widthAngle || angle >= 0 && dist <= 50) || !()) {
    //         continue;
    //     }
    //     img.pixels[i] = color(0, 0, 0, 255);
        // if (angle <= widthAngle && angle >= 0 && dist <= 50) {
        //     float angleN = abs((angle / (widthAngle / 2f)) - 1);
        //     float distN = dist / 50f;
        //     img.pixels[i] = color(0, 0, 0, min(angleN*angleN*255, (distN*(2-distN))*255));
        // } else if (angle <= widthAngle && angle >= 0) {
        //     float angleN = abs((angle / (widthAngle / 2f)) - 1);
        //     img.pixels[i] = color(0, 0, 0, angleN*angleN*255);
        // } else if (dist <= 50) {
        //     float distN = dist / 50f;
        //     img.pixels[i] = color(0, 0, 0, (distN*(2-distN))*255);
        // }
    // }
    setPixelsFromPP(prevPX, prevPY, prevMX, prevMY, true);
    setPixelsFromPP(px, py, mouseX, mouseY, false);
    img.updatePixels();
    
    image(img, 0, 0);
    prevPX = px;
    prevPY = py;
    prevMX = mouseX;
    prevMY = mouseY;
  }

  void setPixelsFromPP(int px, int py, int mx, int my, boolean prev) {
    offsetAngle = (float) Math.toDegrees(atan2(py - my, px - mx));
    // float dist = sqrt(pow(px - x, 2) + pow(py - y, 2));
    // float angle = (float) Math.toDegrees(atan2(py - y, px - x)) - (offsetAngle - (widthAngle / 3));

    // Calculate aura box
    int bsx = px - auraRadius;
    int bsy = py - auraRadius;
    int bex = px + auraRadius;
    int bey = py + auraRadius;
    for (int x = bsx; x <= bex; x++) {
      for (int y = bsy; y <= bey; y++) {
        int i = (y * 1280) + x;
        if (!(i<0 || i>=img.pixels.length)) {
          float dist = sqrt(pow(px - x, 2) + pow(py - y, 2));
          if (dist <= auraRadius) {
            float distN = dist / (float)auraRadius;
            if (!prev) img.pixels[i] = color(0, 0, 0, (distN*(2-distN))*255);
            else img.pixels[i] = color(0, 0, 0, 255);
          }
        }
      }
    }

    // // Calculate cone area
    // int ccx = px;
    // int ccy = py;
    // float slope = (mx - px) != 0 ? (my - py)/(mx - px) : 0;
    // Line2D line1 = new Line2D.Double(
    //   ccx, ccy, mx < ccx ? 0 : mx == ccx ? ccx : 1280,
    //   sqrt(pow((mx < ccx ? 0 : mx == ccx ? ccx : 1280)/cos((float)Math.toRadians(offsetAngle-15)), 2) - (mx < ccx ? 0 : mx == ccx ? ccx : 1280)) == 0 ? my < ccy ? 0 : 720 : sqrt(pow((mx < ccx ? 0 : mx == ccx ? ccx : 1280)/cos((float)Math.toRadians(offsetAngle-15)), 2) - (mx < ccx ? 0 : mx == ccx ? ccx : 1280))
    // );
    // Line2D line2 = new Line2D.Double(
    //   ccx, ccy, mx < ccx ? 0 : mx == ccx ? ccx : 1280,
    //   sqrt(pow((mx < ccx ? 0 : mx == ccx ? ccx : 1280)/cos((float)Math.toRadians(offsetAngle+15)), 2) - (mx < ccx ? 0 : mx == ccx ? ccx : 1280)) == 0 ? my < ccy ? 0 : 720 : sqrt(pow((mx < ccx ? 0 : mx == ccx ? ccx : 1280)/cos((float)Math.toRadians(offsetAngle+15)), 2) - (mx < ccx ? 0 : mx == ccx ? ccx : 1280))
    // );
    
    // Point2D point1 = getIntersectionPoint(line1, windowRect)[0];
    // Point2D point2 = getIntersectionPoint(line2, windowRect)[0];
    // int csx = min((int)point1.getX(), min((int)point2.getX(), ccx));
    // int csy = min((int)point1.getY(), min((int)point2.getY(), ccy));
    // int cex = max((int)point1.getX(), max((int)point2.getX(), ccx));
    // int cey = max((int)point1.getY(), max((int)point2.getY(), ccy));
    // for (int x = csx; x <= cex; x++) {
    //   for (int y = csy; y <= cey; y++) {
    //     int i = (y * 1280) + x;
    //     if (!(i<0 || i>=img.pixels.length)) {
    //       if (prev) {
    //         img.pixels[i] = color(0, 0, 0, 255);
    //         continue;
    //       }
    //       float angle = (float) Math.toDegrees(atan2(py - y, px - x)) - (offsetAngle - (widthAngle / 3));
    //       float dist = sqrt(pow(px - x, 2) + pow(py - y, 2));
    //       if (angle <= widthAngle && angle >= 0 && dist <= auraRadius) {
    //         float angleN = abs((angle / (widthAngle / 2f)) - 1);
    //         float distN = dist / auraRadius;
    //         if (!prev) img.pixels[i] = color(0, 0, 0, min(angleN*angleN*255, (distN*(2-distN))*255));
    //         else img.pixels[i] = color(0, 0, 0, 255);
    //       } else if (angle <= widthAngle && angle >= 0) {
    //           float angleN = abs((angle / (widthAngle / 2f)) - 1);
    //           if (!prev) img.pixels[i] = color(0, 0, 0, angleN*angleN*255);
    //           else img.pixels[i] = color(0, 0, 0, 255);
    //       } else if (dist <= auraRadius) {
    //           float distN = dist / auraRadius;
    //           if (!prev) img.pixels[i] = color(0, 0, 0, (distN*(2-distN))*255);
    //           else img.pixels[i] = color(0, 0, 0, 255);
    //       }
    //     }
    //   }
    // }
  }
  Point2D[] getIntersectionPoint(Line2D line, Rectangle2D rectangle) {

    Point2D[] p = new Point2D[4];

    // Top line
    p[0] = getIntersectionPoint(line,
                    new Line2D.Double(
                    rectangle.getX(),
                    rectangle.getY(),
                    rectangle.getX() + rectangle.getWidth(),
                    rectangle.getY()));
    // Bottom line
    p[1] = getIntersectionPoint(line,
                    new Line2D.Double(
                    rectangle.getX(),
                    rectangle.getY() + rectangle.getHeight(),
                    rectangle.getX() + rectangle.getWidth(),
                    rectangle.getY() + rectangle.getHeight()));
    // Left side...
    p[2] = getIntersectionPoint(line,
                    new Line2D.Double(
                    rectangle.getX(),
                    rectangle.getY(),
                    rectangle.getX(),
                    rectangle.getY() + rectangle.getHeight()));
    // Right side
    p[3] = getIntersectionPoint(line,
                    new Line2D.Double(
                    rectangle.getX() + rectangle.getWidth(),
                    rectangle.getY(),
                    rectangle.getX() + rectangle.getWidth(),
                    rectangle.getY() + rectangle.getHeight()));

    return p;
  }

  public Point2D getIntersectionPoint(Line2D lineA, Line2D lineB) {

    double x1 = lineA.getX1();
    double y1 = lineA.getY1();
    double x2 = lineA.getX2();
    double y2 = lineA.getY2();

    double x3 = lineB.getX1();
    double y3 = lineB.getY1();
    double x4 = lineB.getX2();
    double y4 = lineB.getY2();

    Point2D p = null;

    double d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
    if (d != 0) {
      double xi = ((x3 - x4) * (x1 * y2 - y1 * x2) - (x1 - x2) * (x3 * y4 - y3 * x4)) / d;
      double yi = ((y3 - y4) * (x1 * y2 - y1 * x2) - (y1 - y2) * (x3 * y4 - y3 * x4)) / d;

      p = new Point2D.Double(xi, yi);

    }
    return p;
  }
}