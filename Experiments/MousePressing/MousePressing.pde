boolean test = false;

void setup(){

size(800,800);
background(255,255,255);


}


void draw() {
  if (mousePressed) {
    fill(124,125,125);
    rect(mouseX,mouseY,100,100);
  }
  else {
    fill(66,66,66);
    rect(random(800),random(800),100,100);
  }
  
}