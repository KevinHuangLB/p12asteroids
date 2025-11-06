class Spaceship extends GameObject {
  //instance variables
  PVector dir; //direction
  int cooldown;
  int survivalCooldown;

  //constructor
  Spaceship() {
    super(width/2, height/2, 0, 0, true);
    dir = new PVector(1, 0);
    cooldown = 0;
  }

  //behaviour functions
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);

    rotate(dir.heading());
    drawShip();

    popMatrix();
  }

  void drawShip() {
    fill(black);
    stroke(white);
    strokeWeight(4);

    if (survivalCooldown > 0) {
      stroke(lightGreen);
      circle(0, 0, 50);
    }
    if ((survivalCooldown > 160 && survivalCooldown < 180) || (survivalCooldown > 110 && survivalCooldown < 130)|| 
    (survivalCooldown > 60 && survivalCooldown < 80) || (survivalCooldown > 10 && survivalCooldown < 30)) {
      stroke(red);
      triangle(-10, -15, -10, 15, 30, 0);
    } else {
      stroke(white);
      triangle(-10, -15, -10, 15, 30, 0);
    }
  }

  void act() {
    survivalCooldown--;
    move();
    shoot();
    checkForCollisions();
    checkForAsteroidCollisions();
    wrapAround();
    fill(white);
    text("Lives: "+lives, 100, 100);
  }

  void move() {
    loc.add(vel);

    if (upkey && vel.mag() < 30) {
      vel.mult(0.90);
      vel.add(dir);
    }
    if (downkey && vel.mag() < 30) {
      vel.mult(0.86);
      vel.sub(dir);
    } else {
      vel.mult(0.95);
    }

    if (leftkey) dir.rotate(-radians(4));
    if (rightkey) dir.rotate(radians(4));
  }

  void shoot() {
    cooldown--;
    if (spacekey && cooldown <= 0) {
      objects.add(new Bullet());
      cooldown = 13;
    }
  }

  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if ((dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d) && !obj.shotByPlayer && survivalCooldown <= 0) {
          lives--;
          obj.lives = 0;
          survivalCooldown = 180;
        }
      }
      i++;
    }
  }
  void checkForAsteroidCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
        if ((dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d + obj.d) && survivalCooldown <= 0) {
          lives--;
          survivalCooldown = 180;
        }
      }
      i++;
    }
  }
}
