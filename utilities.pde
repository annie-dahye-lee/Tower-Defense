void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && mousePressed == false) {
    mouseReleased = true;
    wasPressed = false;
  }

  if (start.clicked) mode = MAP_SELECTION;

  if (selectMap1.clicked) {
    mode = PLAY;
    map = 1;
    nodes = 1;
  }

  if (selectMap2.clicked) {
    mode = PLAY;
    map = 2;
    nodes = 2;
  }

  if (buildModeButton.clicked) {
    mode = BUILD;
  }

  if (playButton.clicked) {
    mode = PLAY;
  }
}
