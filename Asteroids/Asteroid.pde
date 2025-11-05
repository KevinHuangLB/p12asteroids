class Asteroid extends GameObject {

  float shapeDecider;
  Asteroid() {
    super(random(width), random(height), 1, 1, random(2));
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives * 30;
    shapeDecider = random(3);
  }

  Asteroid(float lx, float ly, int life, float sd) {
    super(lx, ly, 1, 1, random(2));
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = life;
    d = lives * 30;
    shapeDecider = sd;
  }

  void show() { // use scale fix positioning of the asteroids
    pushMatrix();
    translate(loc.x, loc.y);

    if (lives == 3) scale(1);
    if (lives == 2) scale(0.6);
    if (lives == 1) scale(0.3);
    if (lives == 0) scale(0.01);

    rotate(ro.heading());
    fill(black);
    stroke(white);
    strokeWeight(2);

    //circle(0, 0, d);
    if (shapeDecider < 1) {
      line(0, 0, 0+45, 0);
      line(0, 0, 0 - 30, 0 + 22.5);
      line(0 - 30, 0 + 22.5, 0 + 22.5, 0 + 90);
      line(0 + 22.5, 0 + 90, 0 + 45, 0 + 60);
      line(0 + 45, 0 + 60, 0 + 90, 0 + 60);
      line(0 + 90, 0 + 60, 0 + 45, 0 + 45);
      line(0 + 45, 0 + 45, 0 + 90, 0);
      line(0 + 90, 0, 0 + 45, 0);
    } else if (shapeDecider > 2 && shapeDecider < 3) {
      line(0, 0, 0 + 45, 0 - 22.5);
      line(0 + 45, 0 - 22.5, 0 + 30, 0 + 60);
      line(0 + 30, 0 + 60, 0 + 22.5, 0 + 56.25);
      line(0 + 22.5, 0 + 56.25, 0 - 45, 0 + 60);
      line(0 - 45, 0 + 60, 0 - 90, 0);
      line(0 - 90, 0, 0 - 45, 0 - 45);
      line(0 - 45, 0 - 45, 0, 0);
    } else {
      line(0, 0, 0, 0 - 30);
      line(0, 0 - 30, 0 + 22.5, 0 - 30);
      line(0 + 22.5, 0 - 30, 0 + 22.5, 0);
      line(0 + 22.5, 0, 0 + 75, 0);
      line(0 + 75, 0, 0 + 75, 0 + 18);
      line(0 + 75, 0 + 18, 0 + 30, 0 + 75);
      line(0 + 30, 0 + 75, 0 + 30, 0 + 90);
      line(0 + 30, 0 + 90, 0 + 30, 0 + 90);
      line(0 + 30, 0 + 90, 0 + 22.5, 0 + 90);
      line(0 + 22.5, 0 + 90, 0 - 18, 0 + 75);
      line(0 - 18, 0 + 75, 0 - 22.5, 0 + 22.5);
      line(0 - 22.5, 0 + 22.5, 0 - 45, 0 + 22.5);
      line(0 - 45, 0 + 22.5, 0 - 45, 0);
      line(0 - 45, 0, 0, 0);
    }
    popMatrix();
  }

  void act() {
    ro.rotate(radians(r));
    loc.add(vel);
    wrapAround();
    checkForCollisions();
    checkForPlayerCollisions();
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if ((dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d + obj.d/2) && obj.shotByPlayer) {
          objects.add(new Asteroid(loc.x, loc.y, lives - 1, shapeDecider));
          objects.add(new Asteroid(loc.x, loc.y, lives - 1, shapeDecider));
          lives = 0;
          obj.lives = 0;
        }
      }
      i++;
    }
  }
    void checkForPlayerCollisions() {
      int i = 0;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);
        if (obj instanceof Spaceship) {
          if ((dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d + obj.d/2)) {
            obj.lives = 0;
          }
        }
        i++;
      }
    }
  }
