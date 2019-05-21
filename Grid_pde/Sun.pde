class Sun{
  int centerx, centery;
  Sun(int x){
    centerx = x;
    centery = 0;
    ellipse(x, 0, 10, 10);
  }
  void move(int stop){
    while (centery < stop){
      this.y += 1;
      centery += 1;
    }
  }
}

int cur;
int total = 10000;
/*
void setup(){
  size(1000, 600);
  background(204, 229, 255);
  cur = millis();
}

void draw(){
  if (millis() - cur > total){
     int xcor = (int)Math.random() * 1000;
     int ycor = (int)Math.random() * 600;
     Sun test = new Sun(xcor);
   }
}
*/