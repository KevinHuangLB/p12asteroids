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
    rect(0,-10,60,70,25);
    ellipse(0,0,150,20);
    popMatrix();
  }
  void act() {
    loc.add(vel);
    borders();
    shoot();
    //checkForCollisions();
  }
  
  void shoot(){
    cooldown--;
    if (cooldown <= 0){
     objects.add(new Bullet(loc.x,loc.y,player1.loc.x,player1.loc.y));
     cooldown = 50;
    }
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
