//This function draws the BUILD screen

void build() {
  drawMap();
  buildUI();
  animate();
  buildModeIndicator();
  buildClicks();
}

void drawMap() {
  if (map == 1) drawMap1();
  if (map == 2) drawMap2();
}

void buildUI() {
  fill(grey);
  noStroke();
  rect(965, 350, 270, height-20, 10);
  
  fill(black);
  textFont(script);
  text("elixir   " + elixir, width-130, 50);
  textFont(tandy);
  text(":", width-120, 50);
  
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

}
