//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float x, y, vx, vy, d;
  int hp, maxHp;
  int value;
  color c;
  float speed;

  Mob(float x1, float y1, float vx1, float vy1) {
    this.x = x1;
    this.y = y1;
    this.vx = vx1;
    this.vy = vy1;
  }

  // default
  Mob(float x1, float y1, float vx1, float vy1, int hp, color c) {
    this.x = x1;
    this.y = y1;
    this.vx = vx1;
    this.vy = vy1;
    this.d = 40;
    this.hp = 3;
    this.maxHp = 3;
    this.speed = 2;
    this.c = c;
  }

  void show() {
    fill(c);
    //strokeWeight(3);
    //stroke(black);
    noStroke();
    circle(x, y, d);
    healthbar();
  }

  void act() {
    x += vx*speed;
    y += vy*speed;

    int i = 0; // array length
    while (i < map1nodes.length) {
      if (dist(map1nodes[i].x, map1nodes[i].y, x, y) < 7) { // check distance between mob position and nodes position
        vx = map1nodes[i].dx * speed; // change mob direction according to node direction
        vy = map1nodes[i].dy * speed;
      }
      i++;
    }

    // BULLETS
    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i); //               sum of radii
      if (dist(myBullet.x, myBullet.y, x, y) < (d/2 + (myBullet.d)/2)) {
        bullets.remove(i);
        this.hp -= 1;
      }
      i++;
    }

    ////AOE RING
    //i = 0;
    //while (i < rings.size()) {
    //  AoE_Ring ring = rings.get(i); //    sum of radii
    //  if (dist(x, y, ring.x, ring.y) < (ring.d/2)) {
    //    this.hp -= 0.1;
    //    ring.hp = 0;
    //    println(this.hp);
    //    //ring.cooldown = 0;
    //  }

    //  i++;
    //}
  }

  //AoE_Ring ring = rings.get(i);
  //if (dist(x, y, ring.x, ring.y) < (ring.d/2))

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
