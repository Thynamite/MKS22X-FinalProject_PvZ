class LastDefense implements Display, Move {
  float x, y;
  PImage laneType;
  boolean triggered;
  LastDefense(float xcor, float ycor, PImage type) {
    x = xcor;
    y = ycor;
    laneType = type;
    triggered = false;
  }

  void display() {
    image(laneType, x, y);
  }

  void move() {
    if (triggered) {
      x+= 10;
    }

    if (x >= 1000) {
      triggered = false;
      x = -100;
      y = -100;
    }
  }

  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  boolean getTriggered() {
    return triggered;
  }
  void changeTriggered(boolean t) {
    triggered = t;
  }
  void goAway() {
    x = -100;
    y = -100;
    triggered = false;
  }
}
