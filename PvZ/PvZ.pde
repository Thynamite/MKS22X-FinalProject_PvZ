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
ArrayList<SunFlower> sunflows = new ArrayList<SunFlower>();
int count = 0;
String Selected = "Nothing";
int suntimer = 0; //every ten seconds will fall

int zombietimer = 0;

PImage basicZomb;
PImage sunFlower;
PImage peaShooter;
PImage sun;
PImage mower;
PImage projectile;
PImage lawn;
PImage end;



void setup() {
  imageMode(CENTER);
  basicZomb = loadImage("zombes.png");
  basicZomb.resize(50, 50);
  sunFlower = loadImage("sunflower.png");
  sunFlower.resize(50, 50);
  peaShooter = loadImage("Peashooter.png");
  peaShooter.resize(50, 50);
  sun = loadImage("sun.png");
  sun.resize(50, 50);
  mower = loadImage("Lawn_Mower.png");
  mower.resize(50, 50);
  projectile = loadImage("ProjectilePea.png");
  projectile.resize(50, 50);
  lawn = loadImage("DayLawnPvZ2.png");
  lawn.resize(840, 360);
  end = loadImage("zombieatebrain.png");
  end.resize(width, height);
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

  //plants menu
  fill(102,51,0);
  rect(200,0,300,50);
  fill(153,76,0);
  rect(210,10,280,30);
  Test l = new Test(250,30,peaShooter);
  thingsToDisplay.add(l);
  detects.add(l);
  SunFlower j = new SunFlower(350,30,sunFlower);
  thingsToDisplay.add(j);
  detects.add(j);

  for (int i = 130; i < 460; i += 60) {
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
    Zombie z = new Zombie(1000.0 + temp, spawn.get(location), basicZomb);
    thingsToDisplay.add(z);
    thingsToMove.add(z);
    zom.add(z);
    damageable.add(z);
    temp += 1000;
  }
  /*
  for (int help : spawn) {

    Test thing = new Test(100, i, peaShooter);
    thingsToDisplay.add(thing);
    eaten.add(thing);
    damageable.add(thing);
    detects.add(thing);

    LastDefense d = new LastDefense(70, help, mower);
    thingsToDisplay.add(d);
    //thingsToMove.add(d);
  }
  */
  /*
  Test thingy = new Test(200,200);
   detects.add(thingy);
   thingsToDisplay.add(thingy);
   */
   /*
  for (int i = 130; i < 460; i += 60) {
    SunFlower s = new SunFlower(200, i, sunFlower);
    thingsToDisplay.add(s);
    eaten.add(s);
    //damageable.add(s);
    detects.add(s);
    sunflows.add(s);
  }
  */
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
  image(lawn, 70, 100); //lawn image
  //Create the sun counter
  fill(255, 255, 204);
  rect(0, 0, 200, 50);
  textSize(40);
  fill(253, 143, 59);
  text("Sun : " + currency, 10, 40);

  //plant menu
  fill(102,51,0);
  rect(200,0,300,50);
  fill(153,76,0);
  rect(210,10,280,30);
  if (Selected.equals("PeaShooter")) {
    fill(255,255,204);
    rect(210,10,140,30);
  }
  else if (Selected.equals("SunFlower")) {
    fill(255,255,255);
    rect(310,10,140,30);
  }

  imageMode(CENTER);
  suntimer++;
  if (suntimer >= 600) {
    Sun s = new Sun((float)(Math.random() * 1000), 0, random(200) + 200, sun);
    thingsToDisplay.add(s);
    thingsToMove.add(s);
    sunList.add(s);
    suntimer = 0;
  }
  for (SunFlower s : sunflows) {
    s.updateTimer();
    if (s.getTimer() >= 1440) {
      s.produceSun();
      s.resetTimer();
    }
  }
  for (Sun s : sunList) {
    s.decay();
  }
  zombietimer++; //foor moving the zombies
  if (zombietimer == 1800) {
    for (Zombie z : zom) {
      thingsToMove.add(z);
    }
  }
  //for spawning waves
  if (zombietimer >= 3600 && zombietimer % 180 == 0) {
    if (random(100) <= 20) {
      int rand = int(random(10)) + 4;
      for (int i = 0; i < rand; i++) {
        int location = (int)(Math.random() * 6);
        Zombie z = new Zombie(1000.0, spawn.get(location), basicZomb);
        thingsToDisplay.add(z);
        thingsToMove.add(z);
      }
    }
  }

  for (Display d : thingsToDisplay) {
    d.display();
  }

  for (Zombie z : zom) {
    for (Plant t : eaten) {
      z.damage(t);
    }
  }
  /*
  for (Zombie z : zom) {
    for (LastDefense ds : defenses) {
      z.touchDefense(ds);
      if (ds.getTriggered()) {
        thingsToMove.add(ds);
      }
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
  */
  for (Move m : thingsToMove) {
    m.move();
  }

  for (Plant t : eaten) {
    if (t.getHP() == 0) {
      t.goAway();
      //     thingsToDisplay.remove(t);
    }
  }
  /*
  text(millis(), 500, 500);
  count ++;
  text(count + "count", 100, 500);
  */
  if (count >= 90) {
    for (Plant t : eaten) {
      t.shoot();
    }
    count = 0;
  }

  for (Bullet b : listOfBullets) {
    for (Zombie z : zom) {
      if (b.inRange(z)) {
        b.damage(z);
        b.goAway();
        if (z.getHP() == 0) {
          z.goAway();
        }
        return;
      }

    }
  }



  for (Zombie z : zom) {
    if (z.getX() <= 0) {
      noLoop();
      imageMode(CORNER);
      image(end, 0, 0);
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
}

color suncolor = color(253, 143, 59);

void mousePressed() {

  //color pressed = get(mouseX, mouseY);
  for (Sun s : sunList) {
    if (abs(mouseX - s.getX()) <= 10 && abs(mouseY - s.getY()) <= 10){
      for (int i = 0; i < thingsToDisplay.size(); i ++) {
        if (sunList.contains(thingsToDisplay.get(i))) {
          sunList.remove(thingsToDisplay.get(i));
          thingsToDisplay.remove(thingsToDisplay.get(i));
          currency += 25;
          return;
        }
      }
    }
  }

    if (Selected.equals("Nothing")) {

      for (Plant a : detects) {
        if (a.detect(mouseX, mouseY, 30)) {
          Selected = a.getType();
          return;
        }
      }
    } else if (!Selected.equals("Nothing")) {  //placing a thing, needs a check for validity
      float xcor = 100;
      float ycor = 130;

      if (mouseX >= 100){
        xcor = 100 + 80*( (int)(mouseX / 80));

      }
      if (mouseY >= 130){
        ycor = 130 + 60*( (mouseY - 130 )/60);

      }


      if (Selected.equals("PeaShooter")) {
        if (currency >= 100) {
          Test a = new Test(xcor,ycor,peaShooter);
          thingsToDisplay.add(a);
          eaten.add(a);
          damageable.add(a);
          currency -= 100;
        }
      }
      else if (Selected.equals("sunFlower")) {
        if (currency >= 50) {
          SunFlower s = new SunFlower(xcor,ycor, sunFlower);
          thingsToDisplay.add(s);
          eaten.add(s);
          sunflows.add(s);
          currency -= 50;
        }
      }
      //make the new object here and just place it on the click, needs to center though
      Selected = "Nothing";
    }
  }

  void keyPressed() {
    if (key == 'p') {
      currency += 5000;
    }
    if (key == 'o') {
      zombietimer = 1199;
    }
  }
