class Bullet extends GameObject {

  int timer;

  Bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    //vel = new PVector(mouseX - loc.x, mouseY - loc.y); // Aim with mouse rather than spaceship
    vel.setMag(25);
    timer = 20;
    d = 10;
    shotByPlayer = true;
  }
  Bullet(float lx, float ly, float lx2, float ly2) {
    super(lx, ly, lx2 - lx, ly2 - ly);
    vel.setMag(9);
    timer = 200;
    d = 10;
    shotByPlayer = false;
  }

  void show() {
    fill(black);
    if (shotByPlayer) stroke(white);
    else stroke(red);
    strokeWeight(2);
    circle(loc.x, loc.y, d);
    stroke(white);
  }

  void act() {
    loc.add(vel);
    timer--;
    if (timer == 0) lives = 0;
    
    if (shotByPlayer) wrapAround();
  }
}
