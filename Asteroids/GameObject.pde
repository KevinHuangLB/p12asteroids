class GameObject {

  PVector loc;
  PVector vel;
  PVector ro;
  int lives;
  float d;
  float xOffset, yOffset, wOffset, hOffset, r;
  boolean shotByPlayer;

  GameObject(float lx, float ly, float vx, float vy, float r) { //asteroid rotation
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    ro= new PVector(1, 0);
    this.r=r;
    lives = 1;
    xOffset = 0;
    yOffset = 0;
    wOffset = 0;
    hOffset = 0;
  }
  GameObject(float lx, float ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = 1;
    xOffset = 0;
    yOffset = 0;
    wOffset = 0;
    hOffset = 0;
  }
  GameObject(float lx, float ly, float vx, float vy, float xo, float yo, float wo, float ho) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = 1;
    xOffset = xo;
    yOffset = yo;
    wOffset = wo;
    hOffset = ho;
  }
  GameObject(PVector l, PVector v) { //player bullet
    loc = l;
    vel = v;
    lives = 1;
    xOffset = 0;
    yOffset = 0;
    wOffset = 0;
    hOffset = 0;
  }
  GameObject(PVector l, PVector v, int lv) {
    loc = l;
    vel = v;
    lives = lv;
    xOffset = 0;
    yOffset = 0;
    wOffset = 0;
    hOffset = 0;
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
