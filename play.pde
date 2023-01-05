//This function draws the PLAY screen
int x = 10;
int currNumOfMobs = 0;

void play() {
  if (map == 1) drawMap1();
  if (map == 2) drawMap2();

  playClicks();
  playUI();
  animate();
}

void drawMap1() {

  // nodes
  int i = 0;
  while (i < 14) {
    map1nodes[i].show();
    i++;
  }

  image(bg, 560, 300, width+90, height+220); // dungeon floor
  image(path, 630, 365, width+310, height+210);
}

void drawMap2() {
  image(map2, 300, 390, width, height+90);

  int i = 0;
  while (i < 5) {
    map2nodes[i].show();
    i++;
  }
}

void playUI() {
  fill(grey);
  noStroke();
  rect(965, 350, 270, height-20, 10);
  next.show();
  fill(black);
  //textSize(1);
  textFont(script);
  text("wave   " + wave, width-130, 50);
  textFont(tandy);
  text(":", width-105, 50);

  textFont(script);
  text("elixir   " + elixir, width-130, 125);
  textFont(tandy);
  text(":", width-120, 125);

  textFont(script);
  text("lives   " + lives, width-130, 200);
  textFont(tandy);
  text(":", width-110, 200);


  buildModeButton.show();
}

void animate() {
  addWave();
  // MOBS
  int i = 0;
  while (i < mobs.size()) { // ArrayList.size()
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    if (myMob.hp <= 0) {
      mobs.remove(i);
      elixir += 10;
    } else {
      i++;
    }
  }

  // TOWERS
  i = 0;
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    //println(myTower.cooldown); // && mobs.get(i).x > 0
    if (mobs.size() > 0 && myTower.towerType == GUN && myTower.towerMode == myTower.PLACED) myTower.gunAct();

    if (mobs.size() > 0 && myTower.towerType == SNIPER && myTower.towerMode == myTower.PLACED) myTower.sniperAct(mobs.get(0).x, mobs.get(0).y);

    if (mobs.size() > 0 && myTower.towerType == AOE && myTower.towerMode == myTower.PLACED) myTower.AoEAct(myTower.x, myTower.y);

    myTower.show();
    i++;
  }

  // BULLETS
  i = 0;
  while (i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.show();
    myBullet.act();
    i++;
  }

  if (lives <= 0) mode = GAMEOVER;
}

void playClicks() {
  if (next.clicked && mobs.size() == 0) {
    wave++;
    currNumOfMobs = 0;
  }

  //if (buildModeButton.clicked) {
  //  mode = BUILD;
  //  println("build");
  //}
}

void addWave() { // add wave
  while (mobs.size() < wave && currNumOfMobs != wave) {
    if (map == 1) mobs.add(new Mob(10, 384, 5, 0, 3, white));
    if (map == 2) mobs.add(new Mob(17, 187, 5, 0, 3, white));
    currNumOfMobs++;
    this.x -= 80;

    // chonky
    if (wave % 3 == 0 && currNumOfMobs != wave) {
      for (int i = 0; i < wave/3; i++) {
        if (map == 1) mobs.add(new Chonky(10, 384, 5, 0)); // add new Mob obj to mobs ArrayList
        if (map == 2) mobs.add(new Chonky(10, 384, 5, 0)); // add new Mob obj to mobs ArrayList

        currNumOfMobs++;
      }
    }

    // speedy
    if (wave % 2 == 0 && currNumOfMobs != wave) {
      for (int i = 0; i < wave/2; i++) {
        if (map == 1) {
          Speedy speedy1 = new Speedy(10, 384, 5, 0);
          mobs.add(speedy1); // add new Mob obj to mobs ArrayList
          speedy1.act();
        } else if (map == 2) {
          Speedy speedy2 = new Speedy(32, 190, 5, 0);
          mobs.add(speedy2); // add new Mob obj to mobs ArrayList
          speedy2.act();
        }

        currNumOfMobs++;
      }
    }
  }
}
