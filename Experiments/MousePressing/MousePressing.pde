interface Detectable() {
  Thing detect();
}

void setup(){

  size(800,800);
  background(255,255,255);
  ArrayList<Thing> detects = new ArrayList<Thing>();
  
  for (int i = 0; i < 10; i++) {
    Thing thingy = new Thing(random(800),random(800));
    detects.add(thingy);
  }
  
}

void draw() {
  if (mousePressed) {
    x = mouseX;
    y = mouseY;
    Thing Selected = detect(x,y,10);
  }
  
}

class Thing implements Detectable{
  int xcor, ycor;
  Thing(x,y) {
    xcor = x;
    ycor = y;
  }
  
  Thing detect(int x, int y, int dist) {
    if (abs(x - xcor) < dist && abs(y - ycor) < dist) {
      return this;
    }
  }
}



  