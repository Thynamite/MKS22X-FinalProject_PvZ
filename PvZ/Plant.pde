abstract class Plant implements Detectable, Display {
  float x, y, HP;
  PImage p;
  String str;
  void update() {
  };
  float getHP() {
    return HP;
  };
  void goAway() {
  };
  void shoot() {
  };
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  void bitten(Zombie z) {
  };
  boolean detect(int xcor, int ycor, int dist) {
    return false;
  }
  void display() {
    image(p, x, y);
  }
  String getType() {
    return str;
  }
}
