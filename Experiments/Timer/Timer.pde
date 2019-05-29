
ArrayList<Thing> h = new ArrayList<Thing>();
int x = 0;
int help,pass;

void setup() {
  size(1200,1200);
  background(255);

  for (int x = 0; x < 10; x++ ) {
    Thing a = new Thing();
    h.add(a);
  }
  
  int help = millis();
  
}

void draw() {
  background(255);

  int pass = millis() - help;
  
  
  if (pass > 1000) {
    for (Thing s: h) {
      s.move();
      help = millis();
    }
  }
  
  for (Thing s : h) {
    s.display();
  }

  textSize(100);
  fill(255,0,0);
  text( second(), 100,100);
  text(millis(),100,400);
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
  
  void move() {
    xcor += random(10);
    ycor += random(10);
  }
}