class Spaceship extends GameObject {
  //instance variables
  PVector dir; //direction
  int cooldown;

  //constructor
  Spaceship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(1, 0);
    lives = 5;
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

    triangle(-10, -15, -10, 15, 30, 0);
    //circle(12,0,3);
  }

  void act() {
    move();
    shoot();
    checkForCollisions();
    wrapAround();
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
        if ((dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d) && !obj.shotByPlayer) {
          lives--;
          obj.lives = 0;
        }
      }
      i++;
    }
  }

  
}
