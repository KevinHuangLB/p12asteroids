class Spaceship extends GameObject {
  //instance variables
  PVector dir; //direction
  int cooldown;
  int survivalCooldown;
  int teleportCooldown=0;
  int killCount;

  //constructor
  Spaceship() {
    super(width/2, height/2, 0, 0, true);
    dir = new PVector(1, 0);
    cooldown = 0;
    killCount = 0;
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
    float m = map(teleportCooldown, 120, 0, 60, 0);


    if (survivalCooldown > 0) {
      println(teleportCooldown);
      stroke(lightGreen);
      circle(5, 2, 100);
    }

    if (teleportCooldown > 0) {
      rectMode(CORNER);
      stroke(blue);
      fill(blue);
      rect(-20, -40, m, 5);
      rectMode(CENTER);
    }

    stroke(white);
    fill(black);
    if ((survivalCooldown > 160 && survivalCooldown < 180) || (survivalCooldown > 110 && survivalCooldown < 130)||
      (survivalCooldown > 60 && survivalCooldown < 80) || (survivalCooldown > 10 && survivalCooldown < 30)) {
      stroke(red);
    } else {
      stroke(white);
    }
    triangle(-10, -15, -10, 15, 30, 0);
    stroke(white);
  }

  void act() {
    survivalCooldown--;
    move();
    shoot();
    checkForCollisions();
    checkForAsteroidCollisions();
    if (tpkey && teleportCooldown <= 0) {
      teleport();
      teleportCooldown=120;
    } else if (teleportCooldown > 0) teleportCooldown--;
    wrapAround();
    fill(white);
    //text("Lives: "+lives, 100, 100);
    noFill();
    strokeWeight(2);
    rectMode(CORNER);
    rect(100, 100, 100, 20);
    if (lives == 3) {
      fill(lightGreen);
      noStroke();
      rect(101, 101, 100, 18);
    }
    if (lives == 2) {
      fill(lightOrange);
      noStroke();
      rect(101, 101, 66, 18);
    }
    if (lives == 1) {
      fill(darkRed);
      noStroke();
      rect(101, 101, 33, 18);
    }
    rectMode(CENTER);
  }

  void move() {
    loc.add(vel);

    if (upkey && vel.mag() < 30) {
      vel.mult(0.86);
      vel.add(dir);
      for (int p = 0; p < 6; p++) {
        objects.add(new Particle(loc.x + random(-12, 12), loc.y + random(-12, 12), -1 * vel.x, -1 * vel.y, 6));
      }
    }
    if (downkey && vel.mag() < 30) {
      vel.mult(0.82);
      vel.sub(dir);
    } else {
      vel.mult(0.95);
    }

    if (leftkey) dir.rotate(-radians(3));
    if (rightkey) dir.rotate(radians(3));
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
        if ((dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d + obj.d) && !obj.shotByPlayer && survivalCooldown <= 0) {
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

  void teleport() {
    float x = random(1000);
    float y = random(1000);

    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
        if ((dist(x, y, obj.loc.x, obj.loc.y) > obj.d/2 + 100) ) {
          loc.x=x;
          loc.y=y;
        }
      }
      i++;
    }
  }
}
