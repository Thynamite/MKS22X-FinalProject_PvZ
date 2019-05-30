class Projectile extends Entity {

 int velocity;
 int hostility; //0 for plant source, 1 for zombie source
 String pathing;
 boolean isTouching;

 Projectile(float x, float y, int dmg, int vel, int hostile) {
   xcor = x;
   ycor = y;
   damage = dmg;
   health = 11037;
   velocity = vel;
   isTouching = false;

 }

 void hitSomethingFromPlant(Zombie e) {
   if (e.xcor - 50 == this.xcor + 50 && e.ycor == this.ycor) {
     isTouching = true;

   }
 }

 Entity findTarget() {

 }

 void move() {
   x -= veloctity;
 }

 void display() {
   fill(0,255,0);
   circle(xcor,ycor,50);
 }

 void touched() { //maybe for cleaning up?
   if(isTouching) {
     health = -100000;
     velocity = 0;
   }
 }
}
