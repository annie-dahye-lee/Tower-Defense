void mapSelect() {
  UI();
  mapClicks();
}

void UI() {
  background(black);
  
  textSize(50);
  fill(white);
  text("choose your fate...", width/2, height/2-100, 600, 200);
  
  selectMap1.show();
  selectMap2.show();
}

void mapClicks() {
  //if (selectMap1.clicked) {
  //  map = 1;
  //  nodes = 1;
  //  println(mode);
  //  mode = PLAY;
  //}
  //if (selectMap2.clicked) {
  //  map = 2;
  //  nodes = 2;
  //  mode = PLAY;
  //}
}
