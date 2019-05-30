class Projectile extends Entity {

 int velocity;
 int hostility; //0 for plant source, 1 for zombie source
 String pathing;
 boolean isTouching;

 Projectile(float x, float y, int dmg, int vel, int hostile,String path) {
   xcor = x;
   ycor = y;
   damage = dmg;
   health = 11037;
   velocity = vel;
   isTouching = false;
   pathing = path;
 }

 void hitSomethingFromPlant(Zombie e) {
   if (e.getX() - 50 == this.getX() + 50 && e.getY() == this.getY()) {
     isTouching = true;
     e.health - damage;
   }
 }

 Entity findTarget(ArrayList<Zombie> f) {
   Zombie closest = null;
   closestXCor = 10000000000;
   for (Zombie z : f) {
     if (z.getY() == this.getY()) {
       if (z.getX() < closestXCor) {
         closest = z;
         closestXCor = z.getX();
       }
     }
   }
   return closest;
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
     damage = 0;
   }
 }
}
