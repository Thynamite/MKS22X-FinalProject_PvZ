interface Detectable {
  Thing detect(int x, int y, int dist);
}

interface Display {
  void display();
}

ArrayList<Thing> detects = new ArrayList<Thing>();
Thing Selected;
int plantNum;
boolean overPlant, overShovel, overGrass;

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
  if (overPlant(x,y,10,10)) {
    overPlant = true;
    overShovel = false;
    overGrass = false;
    if (x == 0) {
      plantNum = 0;
    }
    if (x == 1) {
      
  }
}

boolean overPlant(int x, int y, int width, int height){
  if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
    return true;
  }
  else {
    return false;
  }
}

boolean overShovel(int x, int y, int dist) {
}
  
boolean overGrass(int x, int y, int dist) {
}

void mousePressed() {
  for (Thing a : detects) {
    if (overPlant) {
      Selected = a;
    }
    if (overShovel) {
    }
    if (overGrass) {
    }
  }
}



  