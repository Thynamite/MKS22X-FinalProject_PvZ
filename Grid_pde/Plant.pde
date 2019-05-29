abstract class Plant extends Entity {

  int cost;
  double cooldown;
  double coolup = 0;
  String ability;
  boolean ready = true;


  void placePlant(int x, int y) {
    xcor = x;
    ycor = y;
  }

  void intiateCooldown() {
    ready = false;
  }

  void coolingDown() {
    if (coolup != 0) {
      coolup++;
      if (cooldown <= coolup) {
        ready = true;
        coolup = 0;
      }
    }
  }
  void performAbility() {

  }
}
