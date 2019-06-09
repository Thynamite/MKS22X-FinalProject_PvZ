class Test extends Plant implements Display, Damage, Detectable {
  float x, y, HP;
  boolean isFieldPlant; //for ability to select from a menu or not, may need to adjust for before game start selection
  String str = "PeaShooter";
  PImage p = peaShooter;
  Test(float xcor, float ycor, PImage i) {
    x = xcor;
    y = ycor;
    HP = 100;
    p = i;
  }
  Test(Test other) {
    x = other.x;
    y = other.y;
    HP = 100;
    //type = "Thing";
    p = other.p;
  }
  Test (Plant other) {
    x = other.x;
    y = other.y;
    HP = 100;
    p = other.p;
  }
  void display() {
    image(p, x, y);
  }
  void bitten(Zombie z) {
    HP -= 1;
    if (this.getHP() <= 0) {
      z.move();
      z.changeEating();
    }
  }
  float getHP() {
    return HP;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  String toString() {
    return "help";
  }
  void damage() {
  }
  void goAway() {
    y = -100;
    x = -100;
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
  void shoot() {
    for (Zombie z : zom){
      if (z.getY() == y && z.getX() <= 1000){
        Bullet b = new Bullet(x, y);
        thingsToDisplay.add(b);
        thingsToMove.add(b);
        listOfBullets.add(b);
        b.move();
      }
    }
  }

  String getType() {
    return str;
  }
}
