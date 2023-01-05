//A Tower is the player's main defense against the mobs. //<>//
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {
  // tower modes
  final int PLACING = 0;
  final int PLACED = 1;

  float x, y;
  int cooldown, threshold; // timer counts until threshold to shoot
  int towerMode;
  int towerType; // GUN, SNIPER, AOE

  int timer = 5;

  color col;

  Tower(int type) {
    x = mouseX;
    y = mouseY;
    cooldown = 0;
    towerMode = PLACING;
    towerType = type;
    if (towerType == GUN) threshold = 15;
    if (towerType == AOE) threshold = 10;
    if (towerType == SNIPER) threshold = 30;
  }

  void show() {
    // GUN
    if (towerType == GUN) {
      if (towerMode == PLACED) waterMage.show();
      else if (towerMode == PLACING) {
        waterMage.w = 140;
        waterMage.h = 140;
        waterMage.x = mouseX;
        waterMage.y = mouseY;
        waterMage.show();
        if (mousePressed && mouseX < 830) { // when mouse pressed, place tower
          towerMode = PLACED;
          x = mouseX;
          y = mouseY;
        }
      }
    }

    // SNIPER
    if (towerType == SNIPER) {
      if (towerMode == PLACED) guitarShooter.show();
      else if (towerMode == PLACING) {
        guitarShooter.x = mouseX;
        guitarShooter.y = mouseY;
        guitarShooter.w = 300;
        guitarShooter.h = 230;
        guitarShooter.show();
        if (mousePressed && mouseX < 830) { // when mouse pressed, place tower
          towerMode = PLACED;
          x = mouseX;
          y = mouseY;
        }
      }
    }

    // AOE
    if (towerType == AOE) {
      if (towerMode == PLACED) darkWizard.show();
      else if (towerMode == PLACING) {
        darkWizard.x = mouseX;
        darkWizard.y = mouseY;
        darkWizard.w = 210;
        darkWizard.h = 210;
        darkWizard.show();
        if (mousePressed && mouseX < 830) { // when mouse pressed, place tower
          towerMode = PLACED;
          this.x = mouseX;
          this.y = mouseY;
        }
      }
    }
  }

  //=====================================================================================================================================

  void gunAct() {
    if (towerType == GUN) {
      cooldown++;
      if (cooldown >= threshold) {
        cooldown = 0; // reset cooldown
        bullets.add(new Bullet(x, y, 0, -50, 20, black)); // UP
        bullets.add(new Bullet(x, y, 0, 50, 20, black));  // DOWN
        bullets.add(new Bullet(x, y, -50, 0, 20, black)); // LEFT
        bullets.add(new Bullet(x, y, 50, 0, 20, black));  // RIGHT
      }
    }
  }

  //=====================================================================================================================================

  void sniperAct(float mobX, float mobY) {
    // SNIPER TOWER
    if (towerType == SNIPER) {
      cooldown++;
      if (cooldown >= threshold) {
        cooldown = 0; // reset cooldown
        stroke(#afe5e7);
        strokeWeight(6);
        line(this.x, this.y, mobX, mobY);
        mobs.get(0).hp -= 3;
      }
    }
  }
  //=====================================================================================================================================

  void AoEAct(float x, float y) {
    Bullet bullet = new Bullet(this.x+6, this.y+10, 0, 0, 400, #884ce8);
    int i = 0;
    if (towerType == AOE) {
      while (i < mobs.size()) {
        cooldown++;
        if (cooldown > 20) {
          cooldown = 0;
          bullet.showRing();
          if (dist(bullet.x, bullet.y, mobs.get(i).x, mobs.get(i).y) < (mobs.get(i).d/2 + (bullet.d)/2)) mobs.get(i).hp -= 1;
        }
        i++;
      }
    }
  }
}
