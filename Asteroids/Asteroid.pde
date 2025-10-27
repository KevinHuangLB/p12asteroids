class Asteroid extends GameObject {

  float xOffset, yOffset, wOffset, hOffset;
  Asteroid() {
    super(random(width), random(height), 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives * 30;
    xOffset = random(-10, 10);
    yOffset = random(-10, 10);
    wOffset = random(-10, 10);
    hOffset = random(-10, 10);
  }

  Asteroid(float lx, float ly, int life, float xo, float yo, float wo, float ho) {
    super(lx, ly, 1, 1, xo, yo, wo, ho);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = life;
    d = lives * 30;
  }

  void show() {
    fill(black);
    stroke(white);
    //circle(loc.x, loc.y, d);
    strokeWeight(2);
    ellipse(loc.x + xOffset, loc.y + yOffset, d + wOffset, d + hOffset);
    //line(loc.x, loc.y, loc.x+d/2, loc.y);
  }

  void act() {
    loc.add(vel);
    wrapAround();
    checkForCollisions();
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          objects.add(new Asteroid(loc.x, loc.y, lives - 1, obj.xOffset, obj.yOffset, obj.wOffset, obj.hOffset));
          objects.add(new Asteroid(loc.x, loc.y, lives - 1, obj.xOffset, obj.yOffset, obj.wOffset, obj.hOffset));
          lives = 0;
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
