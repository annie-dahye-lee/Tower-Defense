//This function draws the GAMEOVER screen.

void gameOver() {
  background(black);
  fill(white);
  text("GAMEOVER", width/2, height/2, 300, 100);
  text("You played " + wave + " rounds", width/2-200, height/2-300, 300, 100);
  tryAgain.show();
  
  if (tryAgain.clicked) {
    mode = INTRO;
    lives = 3;
    elixir = 30;
    wave = 1;
  }
}
