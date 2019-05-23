class Sun{
  float x, y, end;
  Sun(float x, float y, float stop){
    this.x = x;
    this.y = y;
    end = stop;
  }
  void display(){
    ellipse(x, y, 20, 20);
  }
  void fall(){
    this.y += 10;
  }
}
