interface Detectable {
  boolean detect(int x, int y, int dist);
}

interface Display {
  void display();
}

ArrayList<Thing> detects = new ArrayList<Thing>();
ArrayList<Thing> displays = new ArrayList<Thing>();
Thing Selected;

int plantNum;
boolean overPlant, overShovel, overGrass;

void setup(){

  size(800,800);
  background(255,255,255);


  for (int i = 0; i < 10; i++) {
    Thing thingy = new Thing(random(800),random(800));
    detects.add(thingy);
    displays.add(thingy);
  }


  Thing blob = new Thing(random(800), random(800));

}

void draw() {
  background(255,255,255);

  for (Thing a : detects) {
    a.update();
  }
  for (Thing a : displays) {
    a.display();
  }
}

class Thing implements Detectable, Display{
  float xcor, ycor;
  Thing(float x,float y) {
    xcor = x;
    ycor = y;
  }

  Thing(Thing other) {
    xcor = other.xcor;
    ycor = other.ycor;
  }

  boolean detect(int x, int y, int dist) {
    if (abs(x - xcor) < dist && abs(y - ycor) < dist) {
      return true;
    }
    return false;
  }

  void display() {
    if (Selected == this) {
      fill(0,255,0);
    }
    else {
     fill(255,0,0);
    }
    ellipse(xcor,ycor,50,50);
  }

  void update() {
    if (Selected == this) {
      xcor = mouseX;
      ycor = mouseY;
    }
  }


}

void mousePressed() {

  if ( Selected == null) {  //get a new thing
    Thing Selecteds = null;
    for (Thing a : detects) {
      if (a.detect(mouseX, mouseY, 50)) {

        if (a == Shovel) {
          Selected = Shovel;
        }
        else {
          Selected = a;
          Selecteds = new Thing(a);
          displays.add(0,Selecteds);
        }

      }
    }
    if (Selecteds != null) {
      detects.add(Selecteds);
    }

  }
  else if (Selected != null) {  //placing a thing, needs a check for validity
    if (Selected == Shovel) {
      for (Thing a : detects) {
        if (a.detect(mouseX, mouseY, 50)) {
          a.xcor = null;
          a.ycor = null;
          detect.remove(a);
        }
      }
    }
    Selected.xcor = mouseX;
    Selected.ycor = mouseY;


    Selected = null;
  }
}
/*
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


*/
