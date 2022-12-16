//This function draws the INTRO screen.

void intro() {
  intro.show();
  start.show();
  
  if (start.clicked) mode = MAP_SELECTION;
}
