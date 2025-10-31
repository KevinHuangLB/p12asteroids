class UFO extends GameObject {

  boolean isLeftSide;
  float direction;
  UFO(float lx, float ly, float direc) {
  // 1 = left to right
  // 2 = right to left
  // 3 = top to down
  // 4 = down to top
  super(lx,ly,6,0);
d = 20;
  }
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    drawUFO();
    popMatrix();
  }

  void drawUFO() {
    circle(0, 0, d);
  }
  void act() {
    if (!isLeftSide)loc.add(vel);
    if (isLeftSide)loc.sub(vel);
    borders();
    //checkForCollisions();
  }

  //void checkForCollisions() {
  //  int i = 0;
  //  while (i < objects.size()) {
  //    GameObject obj = objects.get(i);
  //    if (obj instanceof Bullet) {
  //      if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
  //        objects.add(new Asteroid(loc.x, loc.y, lives - 1));
  //        objects.add(new Asteroid(loc.x, loc.y, lives - 1));
  //        lives = 0;
  //        obj.lives = 0;
  //      }
  //    }
  //    i++;
  //  }
  //}

  void borders() {
    if (loc.x > width) {
      lives = 0;
    }
    if (loc.x < 0) {
      lives = 0;
    }
    if (loc.y > height) {
      lives = 0;
    }
    if (loc.y < 0) {
      lives = 0;
    }
  }
}
