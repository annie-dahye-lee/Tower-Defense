//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AoE_Ring { // area of effect ring

  PShape ring1;
  float x, y;
  int d, hp;
  int cooldown, threshold; // timer counts until threshold to shoot

  AoE_Ring(float x, float y, int d) {
    this.x = x;
    this.y = y;
    this.d = d;
    hp = 1;
  }

  void act() {
    bullets.add(new bulletRing(this.x, this.y));
  }

  //i = 0;
  //while (i < mobs.size()) {
  //  Mob mob = mobs.get(i); //               sum of radii
  //  if (dist(myBullet.x, myBullet.y, x, y) < (d/2 + (myBullet.d)/2)) {
  //    this.hp -= 1;
  //    bullets.remove(i);
  //    //println(this.hp);
  //  }
  //  i++;
  //}
}

//void act() {
//  int i = 0;
//  while (i < mobs.size()) { // ArrayList.size()
//    Mob myMob = mobs.get(i);
//    if (dist(myMob.x, myMob.y, x, y) < d/2) {
//      myMob.hp -= 1;
//    }
//  }
//}
