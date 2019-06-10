abstract class Zombie extends Entity implements Move, Display {

  String ability;
  int speed;
  String item;
  String pathing;
  boolean nextTo;
  String type;
  int cooldownEats = 30;

  void useAbility() {

  }

  boolean isNextToPlant(Entity other) {
    if (other.type.equals("Plant")) {
      return true;
    }
  }

  void eat(Plant other){
    this.cooldownEats--;
    if (cooldownEats <= 0) {
      other.health -= 10;
      this.cooldownEats = 30;
    }

  }
}
