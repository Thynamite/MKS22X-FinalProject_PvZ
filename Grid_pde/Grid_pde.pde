ArrayList<Sun> s = new ArrayList<Sun>();
void setup() {
  size(1000, 600);
  background(204, 229, 255);
  boolean[][] openfield = new boolean[6][14];
  //Create the field
  fill(204, 255, 229);
  for (int i = 100; i < 460; i += 60) {
    for (int j = 70; j <= 850; j += 60) {
      rect(j, i, 60, 60);
    }
  }
  //Set all the values that represent the field to true, meaning plants can be placed at that location
  for (int r = 0; r < 6; r ++) {
    for (int c = 0; c < 14; c ++) {
      openfield[r][c] = true;
    }
  }

  //Create the sun counter
  fill(255, 255, 204);
  rect(0, 0, 200, 50);
  textSize(40);
  fill(253, 143, 59);
  text("Sun : ", 10, 40);
  
  for (int i = 0; i < 10; i ++){
    Sun temp = new Sun((float)(Math.random() * 1000), 0.0, (float)(Math.random() * 400));
    s.add(temp);
  }
}

void draw(){
  for (Sun temp : s){
    temp.display();
  }
  for (Sun temp : s){
    temp.fall();
  }
}
