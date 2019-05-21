interface Detectable {
  Thing detect(int x, int y, int dist);
}

interface Display {
  void display();
}

ArrayList<Thing> detects = new ArrayList<Thing>();
Thing Selected;


void setup(){

  size(800,800);
  background(255,255,255);
  
  
  for (int i = 0; i < 10; i++) {
    Thing thingy = new Thing(random(800),random(800));
    detects.add(thingy);
  }
  
}

void draw() {

}

class Thing implements Detectable, Display{
  float xcor, ycor;
  Thing(float x,float y) {
    xcor = x;
    ycor = y;
  }
  
  Thing detect(int x, int y, int dist) {
    if (abs(x - xcor) < dist && abs(y - ycor) < dist) {
      return this;
    }
  }
  
  void display() {
    ellipse(xcor,ycor,50,50);
  }
}

void update(int x, int y) { 
}

boolean overPlant(int x, int y, int dist){
}

boolean overShovel(int x, int y, int dist) {
}
  
boolean overGrass(int x, int y, int dist) {
}

void mousePressed() {
  Thing Selected;
  for (Thing a : detects) {
    if (overPlant) {
    }
    if (overShovel) {
    }
    if (overGrass) {
    }
  }
}



  