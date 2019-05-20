size(1000, 600);
boolean[][] openfield = new boolean[6][14];
for (int i = 100; i < 460; i += 60){
  for (int j = 70; j <= 850; j += 60){
    rect(j, i, 60, 60);
  }
}
for (int r = 0; r < 6; r ++){
  for (int c = 0; c < 14; c ++){
    openfield[r][c] = true;
  }
}