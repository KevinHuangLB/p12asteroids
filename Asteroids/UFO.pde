class UFO extends GameObject {
  int cooldown;

  UFO(float lx, float ly, float vx, float vy) {
    super(lx, ly, vx, vy);
    d = 20;
  }

  void show() {
    drawUFO();
  }

  void drawUFO() {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(black);
    stroke(green);
    scale(0.5);
    rect(0, -10, 60, 70, 25);
    ellipse(0, 0, 150, 20);
    stroke(white);
    popMatrix();
  }
  void act() {
    loc.add(vel);
    vel.mult(0.995);
    borders();
    shoot();
    checkForCollisions();
  }

  void shoot() {
    cooldown--;
    if (cooldown <= 0) {
      objects.add(new Bullet(loc.x, loc.y, player1.loc.x, player1.loc.y));
      cooldown = 250;
    }
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if ((dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d) && obj.shotByPlayer) {
          for (int p = 0; p < 20; p++) {
            objects.add(new Particle(loc.x, loc.y, random(-2, 2), random(-2, 2)));
          }
          lives = 0;
          obj.lives = 0;
        }
      }
      i++;
    }
  }

  void borders() {
    if (loc.x > width) {
      lives = 0;
      ufoPos = random(4);
    }
    if (loc.x < 0) {
      lives = 0;
      ufoPos = random(4);
    }
    if (loc.y > height) {
      lives = 0;
      ufoPos = random(4);
    }
    if (loc.y < 0) {
      lives = 0;
      ufoPos = random(4);
    }
  }
}
