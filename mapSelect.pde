void mapSelect() {
  UI();
  mapClicks();
}

void UI() {
  background(black);
  selectMap1.show();
  selectMap2.show();
}

void mapClicks() {
  if (selectMap1.clicked) {
    map = 1;
    nodes = 1;
    mode = PLAY;
    println("hi");
  }
  if (selectMap2.clicked) {
    map = 2;
    nodes = 2;
    mode = PLAY;
  }
}
