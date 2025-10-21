class Spaceship extends GameObject {
  //instance variables
  PVector dir; //direction
  int cooldown;

  //constructor
  Spaceship() {
    super(width/2, height/2, 0, 0);
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
    //unit circle
    line(10, -50, 10, 50);
    line(-50, 0, 50, 0);

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
      vel.mult(0.925);
      vel.add(dir);
    } else {
      vel.mult(0.95);
    }

    if (leftkey) dir.rotate(-radians(5));
    if (rightkey) dir.rotate(radians(5));
  }

  void shoot() {
    cooldown--;
    if (spacekey && cooldown <= 0) {
      objects.add(new Bullet());
      cooldown = 30;
    }
  }

  void checkForCollisions() {
  }
}
