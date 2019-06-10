class Bullet implements Display, Move {
  float x, y;
  PImage p = projectile;
  Bullet(float xcor, float ycor) {
    x = xcor;
    y = ycor;
  }
  void display() {
    image(p, x, y);
  }
  void move() {
    if (x == -100) {
      return;
    }
    x += 2;
  }
  void damage(Zombie z) {
    if (inRange(z)) {
      z.hit(20);
    }
  }
  boolean inRange(Zombie z) {
    if (z.getX() <= x && z.getY() == y) {
      return true;
    }
    return false;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  void goAway() {
    x = -100;
    y = -100;
  }
}
