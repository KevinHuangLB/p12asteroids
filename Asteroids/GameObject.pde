class GameObject {

  PVector loc;
  PVector vel;
  int lives;
  float d;

  GameObject(float lx, float ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = 1;
  }
  GameObject(PVector l, PVector v) {
    loc = l;
    vel = v;
    lives = 1;
  }
  GameObject(PVector l, PVector v, int lv) {
    loc = l;
    vel = v;
    lives = lv;
  }

  void act() {
  }
  void show() {
  }
  void wrapAround() {
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
}
