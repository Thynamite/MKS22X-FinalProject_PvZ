class PeaShooter extends Offensive {


  PeaShooter(float x, float y) {
    xcor = x;
    ycor = y;

    health = 100;
    damage = 20;

    cost = 100;
    cooldown = 90; //90 frames/ticks in 60 fps = 1.5 seconds

    firing = false;
    range = width-x;

    ability = "single forward pea";
  }
}
