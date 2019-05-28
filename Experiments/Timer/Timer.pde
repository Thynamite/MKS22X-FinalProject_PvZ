
ArrayList<Thing> h = new ArrayList<Thing>();


void setup() {
  size(1200,1200);
  background(255);

  for (int x = 0; x < 10; x++ ) {
    Thing a = new Thing();
    h.add(a);
  }
}

void draw() {
  //background(255);

  int help = millis();

  if (help % 1000 = 0) {
    for (Thing s: h) {
      s.xcor += 1;
      s.ycor += 1;
    }
  }
  for (Thing s : h) {
    s.display();
  }

  textSize(100);
  fill(255,0,0);
  text( second(), 100,100);
  text(help,100,400);
}

class Thing {

  float xcor,ycor;

  Thing(){
    xcor = random(width);
    ycor = random(height);
  }

  void display() {
    fill(12,34,25);
    ellipse(xcor,ycor,50,50);
  }

}
