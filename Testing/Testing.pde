int currency = 0;
ArrayList<Display> thingsToDisplay = new ArrayList<Display>();
ArrayList<Move> thingsToMove = new ArrayList<Move>();
ArrayList<Sun> sunList = new ArrayList<Sun>();
ArrayList<Integer> spawn = new ArrayList<Integer>();
void setup() {
  size(1000, 600);
  background(204, 229, 255);
  boolean[][] openfield = new boolean[6][14];
  //Create the field
  fill(204, 255, 229);
  for (int i = 100; i < 460; i += 60) {
    for (int j = 70; j <= 850; j += 60) {
      rect(j, i, 60, 60);
    }
  }
  //Set all the values that represent the field to true, meaning plants can be placed at that location
  for (int r = 0; r < 6; r ++) {
    for (int c = 0; c < 14; c ++) {
      openfield[r][c] = true;
    }
  }

  //Create the sun counter
  fill(255, 255, 204);
  rect(0, 0, 200, 50);
  textSize(40);
  fill(253, 143, 59);
  text("Sun : " + currency, 10, 40);
  int temp = 1000;
  
  for (int i = 130; i < 460; i += 60){
    spawn.add(i);
  }
  
  for (int i = 0; i < 10; i++) {
    Sun s = new Sun((float)(Math.random() * 1000), 0.0 - temp, 350);
    thingsToDisplay.add(s);
    thingsToMove.add(s);
    sunList.add(s);
    int location = (int)(Math.random() * 6);
    Zombie z = new Zombie(1000.0 + temp, spawn.get(location));
    thingsToDisplay.add(z);
    thingsToMove.add(z);
    temp += 1000;
  }
}

void draw() {
  background(204, 229, 255);
  //Create the field
  fill(204, 255, 229);
  for (int i = 100; i < 460; i += 60) {
    for (int j = 70; j <= 850; j += 60) {
      rect(j, i, 60, 60);
    }
  }
  //Create the sun counter
  fill(255, 255, 204);
  rect(0, 0, 200, 50);
  textSize(40);
  fill(253, 143, 59);
  text("Sun : " + currency, 10, 40);

  for (Display d : thingsToDisplay) {
    d.display();
  }
  for (Move m : thingsToMove) {
    m.move();
  }
  mousePressed();
} 

interface Display {
  void display();
}

interface Move {
  void move();
}

class Sun implements Display, Move {
  float x, y, end;
  Sun(float xcor, float ycor, float stop) {
    x = xcor;
    y = ycor;
    end = stop;
  }
  void display() {
    fill(253, 143, 59);
    ellipse(x, y, 20, 20);
  }
  void move() {
    if (y != end) {
      y += 5;
    }
  }
}

class Zombie implements Display, Move {
  float x, y, HP;
  Zombie(float xcor, float ycor) {
    x = xcor;
    y = ycor;
    HP = 100;
  }
  void display() {
    fill(255, 112, 112);
    ellipse(x, y, 30, 30);
  }
  void move() {
    if (x != 0) {
      x -= 2;
    }
  }
  
}

color suncolor = color(253, 143, 59);
void mousePressed(){
  color pressed = get(mouseX, mouseY);
  if (pressed == suncolor){
    for (int i = 0; i < thingsToDisplay.size(); i ++){
      if (sunList.contains(thingsToDisplay.get(i))){
        sunList.remove(thingsToDisplay.get(i));
        thingsToDisplay.remove(thingsToDisplay.get(i));
        currency += 25;
      }
      return;
    }
  }
}
