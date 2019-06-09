class SunFlower extends Plant implements Display, Detectable {
  float x, y;
  PImage p;
  int timer;
  float HP;
  String str = "sunFlower";

  SunFlower (float xc, float yc, PImage i) {
    x = xc;
    y = yc;
    p = i;
    timer = 1020; //first sun is 7 seconds
    HP = 100;
  }

  void display() {
    image(p, x, y);
  }

  float getX() {
    return x;
  }
  float getY() {
    return y;
  }

  boolean detect(int xcor, int ycor, int dist) {
    if (abs(x- xcor) < dist && abs(y - ycor) < dist) {
      return true;
    }
    return false;
  }
  /*
  void update() {
   if (Selected == this) {
   x = mouseX;
   y = mouseY;
   }
   }
   */

  void produceSun() {
    Sun s = new Sun(x, y, x-10, sun);
    thingsToDisplay.add(s);
    thingsToMove.add(s);
    sunList.add(s);
  }

  void updateTimer() {
    timer++;
  }

  void bitten(Zombie z) {
    HP -= 1;
    if (this.getHP() <= 0) {
      z.move();
      z.changeEating();
    }
  }

  int getTimer() {
    return timer;
  }

  void resetTimer() {
    timer = 0;
  }

  String getType() {
    return str;
  }
}
