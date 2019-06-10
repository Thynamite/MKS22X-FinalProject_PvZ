interface Display {

  void display();
  float getX();
  float getY();
}

interface Move {
  void move();
}

interface Damage {
  void damage();
}

interface Detectable {
  boolean detect(int xcor, int ycor, int dist);
}
