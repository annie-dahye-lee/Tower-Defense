//This function draws the GAMEOVER screen.

void gameOver() {
  background(black);
  fill(white);
  textSize(60);
  text("GAMEOVER", width/2, height/2-100, 300, 100);
  textSize(30);
  text("You played " + wave + " round(s)", width/2, height/2, 500, 100);
  tryAgain.show();

  if (tryAgain.clicked) {
    mode = INTRO;
    lives = 3;
    elixir = 30;
    wave = 1;
  }
}
