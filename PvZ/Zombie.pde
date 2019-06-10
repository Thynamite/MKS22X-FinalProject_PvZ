class Zombie implements Display, Move, Damage {
  float x, y, HP;
  int eaten = 0;
  boolean eating;
  PImage p;
  Zombie(float xcor, float ycor, PImage i) {
    x = xcor;
    y = ycor;
    HP = 100;
    eating = false;
    p = i;
  }
  void display() {
    /*
    fill(255, 112, 112);
     ellipse(x, y, 30, 30);
     */
    image(p, x, y);
  }
  void move() {
    if (x == -100) {
      return;
    } else if (x != 0 && !eating) {
      x -= 2;
    }
  }

  void touchDefense(LastDefense other) {
    if (x <= other.getX() + 30 && y == other.getY()) {

      other.changeTriggered(true);
      this.HP = 0;
      //thingsToMove.add(d);
    }
  }
  void damage(){};
  void damage(Plant other) {
    if (x == other.getX() + 30 && y == other.getY()) {
      eating = true;
      other.bitten(this);
    }
  }
  void changeEating() {
    if (eating == false) {
      eating = true;
    } else {
      eating = false;
    }
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  float getHP() {
    return HP;
  }
  void hit(float loss) {
    HP -= loss;
  }
  void goAway() {
    y = -100;
    x = -100;
  }
}
