//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {
  float x, y, vx, vy, d, hp;
  color c;

  Bullet(float x, float y, float vx, float vy, int d, color c) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.d = d;
    this.c = c;
  }

  Bullet(float x, float y, float vx, float vy, int d) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.d = d;
  }

  void act() {
    this.x += vx;
    this.y += vy;
  }

  void show() {
    if (this.x > -d/2 && this.x < 830 && this.y > 0 && this.y < height) {
      image(waterMageMagic, x, y, 50, 50);
    }
  }

  void showRing() {
    fill(c);
    noStroke();
    if (this.x > -d/2 && this.x < 830 && this.y > 0 && this.y < height) {
      circle(x, y, d);
    }
  }
}
