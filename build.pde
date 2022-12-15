//This function draws the BUILD screen

void build() {
  mode = BUILD;
  drawMap1();
  animate();
  buildUI();
  buildModeIndicator();
  buildClicks();
}

void buildUI() {
  fill(grey);
  rect(965, 350, 270, height-20, 10);
  fill(black);
  textSize(35);
  text("elixir: " + elixir, width-130, 50);
  playButton.show();
  buyGunTowerButton.show();
  buySniperTowerButton.show();
  buyAoETowerButton.show();
}

void buildModeIndicator() {
}

void buildClicks() {
  buyGunTowerButton.towerButton = true;
  buySniperTowerButton.towerButton = true;
  buyAoETowerButton.towerButton = true;

  // BULLET
  if (buyGunTowerButton.clicked && elixir >= price[0]) {
    towers.add(new Tower(GUN));
    elixir -= price[0];
  }

  // SNIPER
  if (buySniperTowerButton.clicked && elixir >= price[1]) {
    towers.add(new Tower(SNIPER));
    elixir -= price[1];
  }

  if (buyAoETowerButton.clicked && elixir >= price[2]) {
    towers.add(new Tower(AOE));
    elixir -= price[2];
  }

  if (playButton.clicked) mode = PLAY;
}
