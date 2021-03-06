class Sun implements Display, Move {
  float x, y, end;
  PImage p;
  int time = 600;
  Sun(float xcor, float ycor, float stop, PImage i) {
    x = xcor;
    y = ycor;
    end = stop;
    p = i;
  }
  void display() {

    image(p, x, y);
  }
  void move() {
    if (y < end) {
      y += 5;
    }
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  void decay(){
    if (time == 0){
      x = -100;
      y = -100;
    }
    else{
      time --;
    }
  }
}
