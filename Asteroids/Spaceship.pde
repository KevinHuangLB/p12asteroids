class Spaceship {
  //instance variables
  PVector loc; //location
  PVector vel; //velocity
  PVector dir; //direction

  float accel;
  //constructor
  Spaceship() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    dir = new PVector(1, 0);
    accel = 1;
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
  }

  void move() {
    loc.add(vel);

    println("dir" + dir.mag());
    println(vel.mag());
    println(upkey);

    if (upkey) {
      vel.add(dir);
      if (!upkey){
        vel.sub(dir);
      }
    }

    if (leftkey) dir.rotate(-radians(5));
    if (rightkey) dir.rotate(radians(5));

    if (loc.x > width) {
      loc.x = 0;
    }
    if (loc.x < 0) {
      loc.x = width;
    }
    if (loc.y > height) {
      loc.y = 0;
    }
    if (loc.y < 0) {
      loc.y = height;
    }
  }

  void shoot() {
  }

  void checkForCollisions() {
  }
}
