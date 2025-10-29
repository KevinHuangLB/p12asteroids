class Asteroid extends GameObject {

  float shapeDecider;
  Asteroid() {
    super(random(width), random(height), 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives * 30;
    shapeDecider = random(3);
  }

  Asteroid(float lx, float ly, int life) {
    super(lx, ly, 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = life;
    d = lives * 30;
    shapeDecider = random(3);
  }

  void show() {
    fill(black);
    stroke(white);
    //circle(loc.x, loc.y, d);
    strokeWeight(2);
    
    //line(loc.x, loc.y, loc.x+d/2, loc.y);
    //line(loc.x, loc.y, loc.x - d/3, loc.y + d/4);
    //line(loc.x - d/3, loc.y + d/4, loc.x + d/4, loc.y + d);
    //line(loc.x + d/4, loc.y + d, loc.x + d/2, loc.y + d/1.5);
    //line(loc.x + d/2, loc.y + d/1.5, loc.x + d, loc.y + d/1.5);
    //line(loc.x + d, loc.y + d/1.5, loc.x + d/2, loc.y + d/2);
    //line(loc.x + d/2, loc.y + d/2, loc.x + d, loc.y);
    //line(loc.x + d, loc.y, loc.x + d/2, loc.y);
    
    //line(loc.x, loc.y, loc.x + d/2, loc.y - d/4);
    //line(loc.x + d/2, loc.y - d/4, loc.x + d/3, loc.y + d/ 1.5);
    //line(loc.x + d/3, loc.y + d/1.5, loc.x + d/4, loc.y + d/1.75);
    //line(loc.x + d/4, loc.y + d/1.75, loc.x - d/2, loc.y + d/1.5);
    //line(loc.x - d/2, loc.y + d/1.5, loc.x - d, loc.y);
    //line(loc.x - d, loc.y, loc.x - d/2, loc.y - d/2);
    //line(loc.x - d/2, loc.y - d/2, loc.x, loc.y);
    
    line(loc.x, loc.y, loc.x, loc.y - d/3);
    line(loc.x, loc.y - d/3, loc.x + d/4, loc.y - d/3);
    line(loc.x + d/4, loc.y - d/3, loc.x + d/4, loc.y);
    

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
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/1.5 + obj.d/2) {
          objects.add(new Asteroid(loc.x, loc.y, lives - 1));
          objects.add(new Asteroid(loc.x, loc.y, lives - 1));
          lives = 0;
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
