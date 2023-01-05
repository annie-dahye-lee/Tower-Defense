class Speedy extends Mob {

  Speedy(float x1, float y1, float vx1, float vy1) {
    super(x1, y1, vx1, vy1);
    d = 40;
    hp = 1;
    maxHp = 1;
    value = 40;
    c = purple;
    speed = 3;
  }

 void show() {
    image(ghoul, x, y, d+25, d+25);
    healthbar();
  }

  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);//background
    fill(red);
    rect(x-25, y-(d+10), 50, 20);
    fill(green);
    rect(x-25, y-(d+11), hp*50/maxHp, 21);
    rectMode(CENTER);
  }
}
