abstract class Entity{

  int health;
  int damage;
  float xcor,ycor;

  Entity(int h, int d, float x, float y) {
    health = h;
    damage = d;
    xcor = x;
    ycor = y;
  }
  boolean checkHp() {
    return health > 0;
  }

  Entity detectNearby(int dist, Entity other) {
    if (sqrt(pow(this.xcor - other.xcor,2) + pow(this.ycor-other.ycor,2)) < dist) {
      return other;
    }
  }

  int getHp(){
    return health;
  }

  void setHp(int hp){
    health = hp;
  }

  int getDMG(){
    return damage;
  }

  void setDMG(int dmg){
    damage = dmg;
  }

  float getX(){
    return xcor;
  }

  float getY(){
    return ycor;
  }

  void setX(float x){
    xcor = x;
  }

  void setY(float y) {
    ycor = y;
  }

}
