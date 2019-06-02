int currency = 50;
ArrayList<Display> thingsToDisplay = new ArrayList<Display>();
ArrayList<Move> thingsToMove = new ArrayList<Move>();
ArrayList<Sun> sunList = new ArrayList<Sun>();
ArrayList<Integer> spawn = new ArrayList<Integer>();
ArrayList<Test> eaten = new ArrayList<Test>();
ArrayList<Zombie> zom = new ArrayList<Zombie>();
ArrayList<Damage> damageable = new ArrayList<Damage>();
boolean[][] openfield = new boolean[6][14];
ArrayList<Test> detects = new ArrayList<Test>();

Test Selected = null;
int suntimer = 0; //every ten seconds will fall

interface Detectable{
  boolean detect(int xcor, int ycor, int dist);
}

void setup() {
  size(1000, 600);
  background(204, 229, 255);
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
    /*
    Sun s = new Sun((float)(Math.random() * 1000), 0.0 - temp, 350);
    thingsToDisplay.add(s);
    thingsToMove.add(s);
    sunList.add(s);
    */
    int location = (int)(Math.random() * 6);
    Zombie z = new Zombie(1000.0 + temp, spawn.get(location));
    thingsToDisplay.add(z);
    thingsToMove.add(z);
    zom.add(z);
    damageable.add(z);
    temp += 1000;
  }

  for (int i = 130; i < 460; i += 60){
    Test thing = new Test(100, i);
    thingsToDisplay.add(thing);
    eaten.add(thing);
    damageable.add(thing);
    detects.add(thing);
  }

  Test thingy = new Test(200,200);
  detects.add(thingy);
  thingsToDisplay.add(thingy);
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

  suntimer++;
  if (suntimer >= 600) {
    Sun s = new Sun((float)(Math.random() * 1000), 0, random(200) + 200);
    thingsToDisplay.add(s);
    thingsToMove.add(s);
    sunList.add(s);
    suntimer = 0;
  }
  for (Test a : detects) {
    a.update();
    //text(a.getX(),a.getX(),a.getY());
  }

  for (Display d : thingsToDisplay) {
    d.display();
  }

  for (Zombie z : zom){
    for (Test t : eaten){
      z.damage(t);
    }
  }

  for (Move m : thingsToMove) {
    m.move();
  }

  for (Test t : eaten){
    if (t.getHP() == 0){
      t.goAway();
 //     thingsToDisplay.remove(t);
    }
  }


  text(mouseX,400,400);
  text(mouseY,400,500);
  /*
  if(Selected != null) {
    text(Selected.toString(),400,600);
  }
 */
 text(millis(),500,500);
}

interface Display {
  void display();
}

interface Move {
  void move();
}

interface Damage {
  void damage();
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
    if (y < end) {
      y += 5;
    }
  }
  boolean detect(int xcor, int ycor, int dist) {
  if (abs(x- xcor) < dist && abs(y - ycor) < dist) {
    return true;
  }
  return false;
}
}

class Zombie implements Display, Move, Damage {
  float x, y, HP;
  int eaten = 0;
  boolean eating;
  Zombie(float xcor, float ycor) {
    x = xcor;
    y = ycor;
    HP = 100;
    eating = false;
  }
  void display() {
    fill(255, 112, 112);
    ellipse(x, y, 30, 30);
  }
  void move() {
    if (x != 0 && !eating) {
      x -= 10;
    }
  }
  void damage(){
  }
  void damage(Test other){
    if (x == other.getX() + 30 && y == other.getY()){
      eating = true;
      other.bitten(this);
    }
  }
  void changeEating() {
    if (eating == false) {
      eating = true;
    }
    else {
      eating = false;
    }
  }
}

class Test implements Display, Damage, Detectable{
  float x, y, HP;
  boolean isFieldPlant; //for ability to select from a menu or not, may need to adjust for before game start selection
  Test(float xcor, float ycor){
    x = xcor;
    y = ycor;
    HP = 100;
  }
    Test(Test other) {
    x = other.x;
    y = other.y;
    //type = "Thing";
  }

  void display() {
    fill(50,205,50);
    ellipse(x, y, 30, 30);

  }
  void bitten(Zombie z){
    HP -= 1;
    if (this.getHP() <= 0){
      z.move();
      z.changeEating();
    }
  }
  float getHP(){
    return HP;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  String toString(){
    return "help";
  }
  void damage(){
  }
  void goAway(){
    y = 0;
  }
    boolean detect(int xcor, int ycor, int dist) {
    if (abs(x- xcor) < dist && abs(y - ycor) < dist) {
      return true;
    }
    return false;
  }


  void update() {
    if (Selected == this) {
      x = mouseX;
      y = mouseY;
    }
  }


}
//ArrayList<float> xcoordinates = {100};
color suncolor = color(253, 143, 59);
void mousePressed(){

  color pressed = get(mouseX, mouseY);
  if (pressed == suncolor){
    for (int i = 0; i < thingsToDisplay.size(); i ++){
      if (sunList.contains(thingsToDisplay.get(i))){
        if (sunList.get(i).detect(mouseX,mouseY,30) ) {
          sunList.remove(thingsToDisplay.get(i));
          thingsToDisplay.remove(thingsToDisplay.get(i));
          currency += 25;
          //return;
        }
      }
      return;
    }
  }

  if (Selected == null) {
   Test Selecteds = null;
    for (Test a : detects) {
      if (a.detect(mouseX, mouseY, 50)) {

          Selected = a;
          Selecteds = new Test(a);
          thingsToDisplay.add(Selecteds);
        }

      }
    if (Selecteds != null) {
      detects.add(Selecteds);
    }
  }
    else if (Selected != null) {  //placing a thing, needs a check for validity
    /*
    if (Selected.isA().equals("Shovel")) {
      Thing RemoveMe;
      for (Thing a : detects) {
        if (a.detect(mouseX, mouseY, 50)) {
          RemoveMe = a;

        }
      }
      RemoveMe = null;
      Selected = null;
    }
    else {
      */
      //if (mouseX )
      Selected.x = mouseX;
      Selected.y = mouseY;


      Selected = null;
   // }

  }
}
