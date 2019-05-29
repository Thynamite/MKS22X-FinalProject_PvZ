class Plant extends Entity {

  int cost;
  double cooldown;
  String ability;

  Plant(int h, int d, float x, float y, int co, double cd, String abs) {
    super(h,d,x,y); //placeholder
    cost = co;
    cooldown = cd;
    ability = abs;
  }

  void placePlant(int x, int y) {
    xcor = x;
    ycor = y;
  }

  void intiateCooldown() {

  }

  void performAbility() {

  }
}
