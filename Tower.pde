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
    if (towerType == AOE) threshold = 20;
    if (towerType == SNIPER) threshold = 30;
  }

  void show() {
    // GUN
    if (towerType == GUN) {
      fill(blue);
      strokeWeight(4);
      stroke(black);
      if (towerMode == PLACED) square(x, y, 40);
      else if (towerMode == PLACING) {
        square(mouseX, mouseY, 40);
        if (mousePressed) { // when mouse pressed, place tower
          towerMode = PLACED;
          x = mouseX;
          y = mouseY;
        }
      }
    }

    // SNIPER
    if (towerType == SNIPER) {
      fill(purple);
      strokeWeight(4);
      stroke(black);
      if (towerMode == PLACED) circle(x, y, 50);
      else if (towerMode == PLACING) {
        circle(mouseX, mouseY, 50);
        if (mousePressed) { // when mouse pressed, place tower
          towerMode = PLACED;
          x = mouseX;
          y = mouseY;
        }
      }
    }

    // AOE
    if (towerType == AOE) {
      fill(pink);
      strokeWeight(4);
      stroke(black);
      if (towerMode == PLACED) triangle(x, y, x+50, y, x+25, y-50);
      else if (towerMode == PLACING) {
        triangle(mouseX, mouseY, mouseX+50, mouseY, mouseX+25, mouseY-50); // hovering bullet tower to place
        if (mousePressed) { // when mouse pressed, place tower
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
        stroke(red);
        strokeWeight(6);
        line(this.x, this.y, mobX, mobY);
        mobs.get(0).hp -= 3;
      }
    }
  }
  //=====================================================================================================================================

  void AoEAct(float x, float y) {
    AoE_Ring ring = new AoE_Ring(x, y, 300);
    rings.add(ring);

    cooldown++;
    if (cooldown > threshold) {
      ring.act();
      cooldown = 0;
    }
  }
}
