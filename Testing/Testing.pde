int currency = 50;
ArrayList<Display> thingsToDisplay = new ArrayList<Display>();
ArrayList<Display> thingsToRemove = new ArrayList<Display>();
ArrayList<Move> thingsToMove = new ArrayList<Move>();
ArrayList<Sun> sunList = new ArrayList<Sun>();
ArrayList<Integer> spawn = new ArrayList<Integer>();
ArrayList<Plant> eaten = new ArrayList<Plant>();
ArrayList<Zombie> zom = new ArrayList<Zombie>();
ArrayList<Damage> damageable = new ArrayList<Damage>();
boolean[][] openfield = new boolean[6][14];
ArrayList<Plant> detects = new ArrayList<Plant>();
ArrayList<Bullet> listOfBullets = new ArrayList<Bullet>();
ArrayList<Bullet> remove = new ArrayList<Bullet>();
ArrayList<LastDefense> defenses = new ArrayList<LastDefense>();
int count = 0;
Plant Selected = null;
int suntimer = 0; //every ten seconds will fall
int plant1 = -1;

PImage basicZomb;
PImage sunFlower;
PImage peaShooter;
PImage sun;
PImage mower;
PImage projectile;
PImage lawn;

interface Detectable{
  boolean detect(int xcor, int ycor, int dist);
}

void setup() {
  imageMode(CENTER);
    basicZomb = loadImage("zombes.png");
    basicZomb.resize(50, 50);
    sunFlower = loadImage("sunflower.png");
    sunFlower.resize(50, 50);
    peaShooter = loadImage("Peashooter.png");
    peaShooter.resize(50, 50);
    sun = loadImage("sun.png");
    sun.resize(50,50);
    mower = loadImage("Lawn_Mower.png");
    mower.resize(50,50);
    projectile = loadImage("ProjectilePea.png");
    projectile.resize(50,50);
    lawn = loadImage("DayLawnPvZ2.png");
    lawn.resize(840,360);

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
  int rands = (int)random(50) + 10;
  for (int i = 0; i < rands; i++) {
    /*
    Sun s = new Sun((float)(Math.random() * 1000), 0.0 - temp, 350);
    thingsToDisplay.add(s);
    thingsToMove.add(s);
    sunList.add(s);
    */
    int location = (int)(Math.random() * 6);
    Zombie z = new Zombie(1000.0 + temp, spawn.get(location),basicZomb);
    thingsToDisplay.add(z);
    thingsToMove.add(z);
    zom.add(z);
    damageable.add(z);
    temp += 1000;
  }

  for (int i = 130; i < 460; i += 60){
    Test thing = new Test(100, i, peaShooter);
    thingsToDisplay.add(thing);
    eaten.add(thing);
    damageable.add(thing);
    detects.add(thing);

    LastDefense d = new LastDefense(70,i,mower);
    thingsToDisplay.add(d);
    //thingsToMove.add(d);
  }
  /*
  Test thingy = new Test(200,200);
  detects.add(thingy);
  thingsToDisplay.add(thingy);
  */
  for (int i = 130; i < 460; i += 60) {
    SunFlower s = new SunFlower(200, i, sunFlower);
    thingsToDisplay.add(s);
    eaten.add(s);
    //damageable.add(s);
    detects.add(s);
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
  imageMode(CORNER);
  image(lawn,70,100); //lawn image
  //Create the sun counter
  fill(255, 255, 204);
  rect(0, 0, 200, 50);
  textSize(40);
  fill(253, 143, 59);
  text("Sun : " + currency, 10, 40);
  imageMode(CENTER);
  suntimer++;
  if (suntimer >= 600) {
    Sun s = new Sun((float)(Math.random() * 1000), 0, random(200) + 200, sun);
    thingsToDisplay.add(s);
    thingsToMove.add(s);
    sunList.add(s);
    suntimer = 0;
  }

  if (plant1 != -1) {
    plant1++;
    //listofplants.get(1)
    if(plant1 >= 1000) {
      //listofplants.get(1) ready
      plant1 = 0;
    }
  }
  for (Plant a : detects) {
    a.update();
    //text(a.getX(),a.getX(),a.getY());
  }

  for (Display d : thingsToDisplay) {
    d.display();
  }

  for (Zombie z : zom){
    for (Plant t : eaten){
      z.damage(t);
    }
  }

  for (Zombie z : zom) {
    for (LastDefense ds: defenses) {
      z.touchDefense(ds);
    }
  }
  for (LastDefense d : defenses) {
    if (d.getTriggered()) {
      d.goAway();
      for (Zombie z : zom) {
        if (z.getY() == d.getY()) {
          z.goAway();
          //thingsToMove.add(d);

        }
      }
    }
  }

  for (Move m : thingsToMove) {
    m.move();
  }

  for (Plant t : eaten){
    if (t.getHP() == 0){
      t.goAway();
 //     thingsToDisplay.remove(t);
    }
  }

  for (Display d : thingsToDisplay) {
    if (d.getX() == -100 && d.getY() == -100) {
      thingsToRemove.add(d);
    }
  }
  if (thingsToRemove.size() > 0) {
    for (int x = 0; x < thingsToRemove.size(); x++) {
      thingsToRemove.remove(x);
    }
  }
  /*
  text(mouseX,400,400);
  text(mouseY,400,500);
  */
  /*
  if(Selected != null) {
    text(Selected.toString(),400,600);
  }
 */
 text(millis(),500,500);
  count += 5;
 text(count + "count" , 100, 500);
 if (count == 1000){
   for (Plant t : eaten){
     t.shoot();
   }
   count = 0;
 }

 for (Bullet b : listOfBullets){
   for (Zombie z : zom){
     if (b.inRange(z)){
       b.damage(z);
       if (z.getHP() == 0){
         z.goAway();
       }
       remove.add(b);
     }
   }
 }

 for (Bullet b : remove){
   thingsToDisplay.remove(b);
   thingsToMove.remove(b);
 }
}

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

class Sun implements Display, Move {
  float x, y, end;
  PImage p;

  Sun(float xcor, float ycor, float stop, PImage i) {
    x = xcor;
    y = ycor;
    end = stop;
    p = i;
  }
  void display() {

    image(p,x,y);

  }
  void move() {
    if (y < end) {
      y += 5;
    }
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
}

abstract class Plant implements Detectable, Display{
  float x,y,HP;
  PImage p;
  void update(){};
  float getHP(){
    return HP;
  };
  void goAway(){};
  void shoot(){};
  float getX() {
    return x;
  }
  float getY(){
    return y;
  }
  void bitten(Zombie z){};
  boolean detect(int xcor, int ycor, int dist){
    return false;
  }
  void display(){
    image(p,x,y);
  }
}

class Zombie implements Display, Move, Damage {
  float x, y, HP;
  int eaten = 0;
  boolean eating;
  PImage p;
  Zombie(float xcor, float ycor, PImage i) {
    x = xcor;
    y = ycor;
    HP = 100;
    eating = false;
    p = i;
  }
  void display() {
    /*
    fill(255, 112, 112);
    ellipse(x, y, 30, 30);
    */
    image(p,x,y);
  }
  void move() {
    if (x == -100) {
      return;
    }
    else if (x != 0 && !eating) {
      x -= 10;
    }
  }
  void damage(){
  }
  void touchDefense(LastDefense d) {
    if (x == d.getX() + 30 && y == d.getY()) {

      d.changeTriggered(true);
      HP = 0;
      //thingsToMove.add(d);
    }
  }
  void damage(Plant other){
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
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  float getHP(){
    return HP;
  }
  void hit(float loss){
    HP -= loss;
  }
  void goAway(){
    y = -100;
    x = -100;
  }
}

class Test extends Plant implements Display, Damage, Detectable{
  float x, y, HP;
  boolean isFieldPlant; //for ability to select from a menu or not, may need to adjust for before game start selection
  PImage p;
  Test(float xcor, float ycor, PImage i){
    x = xcor;
    y = ycor;
    HP = 100;
    p = i;
  }
    Test(Test other) {
    x = other.x;
    y = other.y;
    HP = 100;
    //type = "Thing";
    p = other.p;
  }
  Test (Plant other) {
    x = other.x;
    y = other.y;
    HP = 100;
    p = other.p;
  }
  void display() {
    image(p,x,y);

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
    y = -100;
    x = -100;
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

  void shoot(){
    Bullet b = new Bullet(x, y);
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    listOfBullets.add(b);
    b.move();
  }

}

class SunFlower extends Plant implements Display, Detectable {
  float x,y;
  PImage p;
  int timer;
  float HP;

  SunFlower (float xc, float yc, PImage i) {
    x = xc;
    y = yc;
    p = i;
    timer = 0;
    HP = 100;
  }

  void display() {
    image(p,x,y);
  }

  float getX(){
    return x;
  }
  float getY(){
    return y;
  }

  boolean detect(int xcor, int ycor, int dist) {
    if (abs(x- xcor) < dist && abs(y - ycor) < dist) {
      return true;
    }
    return false;
  }
  /*
  void update() {
    if (Selected == this) {
      x = mouseX;
      y = mouseY;
    }
  }
  */

  void produceSun(){
    Sun s = new Sun(x,y,x-10,sun);
    thingsToDisplay.add(s);
    thingsToMove.add(s);
    sunList.add(s);
  }

  void updateTimer(){
    timer++;
  }

  void bitten(Zombie z){
    HP -= 1;
    if (this.getHP() <= 0){
      z.move();
      z.changeEating();
    }
  }
}

class Bullet implements Display, Move{
  float x, y;
  PImage p = projectile;
  Bullet(float xcor, float ycor){
    x = xcor;
    y = ycor;
  }
  void display(){
    image(p,x,y);
  }
  void move(){
    x += 2;
  }
  void damage(Zombie z){
    if (inRange(z)){
      z.hit(1);
    }
  }
  boolean inRange(Zombie z){
    if (z.getX() - x <= 20 && z.getY() - y <= 20){
      return true;
    }
    return false;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
}

class LastDefense implements Display {
  float x,y;
  PImage laneType;
  boolean triggered;
  LastDefense(float xcor, float ycor, PImage type) {
    x = xcor;
    y = ycor;
    laneType = type;
    triggered = false;
  }

  void display() {
    image(laneType,x,y);
  }

  void move() {
    if (triggered) {
      x+= 10;
    }

    if (x >= width) {
      triggered = false;
      x = -100;
      y = -100;
    }
  }

  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  boolean getTriggered() {
    return triggered;
  }
  void changeTriggered(boolean t) {
    triggered = t;
  }
  void goAway() {
    x = -100;
    y = -100;
    triggered = false;
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
        return;
      }
    }
  }

  if (Selected == null) {
    Plant Selecteds = null;
    for (Plant a : detects) {
      if (a.detect(mouseX, mouseY, 30)) {

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

      Selected.x = mouseX;
      Selected.y = mouseY;

      Selected = null;

    }

  }
