abstract class Offensive extends Plant {

  int range;
  boolean firing;


  boolean isZombieInRange(Zombie z){
    if (z.ycor = this.ycor) {
      firing = true;
    }
    else {
      firing = false;
    }
  }

  void attack() {
    //spawn projectile
  }
}
