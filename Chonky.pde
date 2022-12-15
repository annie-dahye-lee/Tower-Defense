class Chonky extends Mob {
  
  Chonky(float x1, float y1, float vx1, float vy1) {
    super(x1, y1, vx1, vy1);
    d = 85;
    maxHp = 20 + wave;
    hp = maxHp;
    value = 25;
    c = pink;
    speed = 0.3;
  }
}
