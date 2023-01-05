//This function draws the INTRO screen.

void intro() {
  intro.show();
  start.show();
  
  textSize(90);
  fill(white);
  text("MAGIC AND MORTALS", width/2, height/2-100, 700, 300);
  
  if (start.clicked) mode = MAP_SELECTION;
}
