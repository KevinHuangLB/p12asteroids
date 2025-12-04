class Particle extends GameObject {

  color particleColor;
  int timer;
  int timerValue;

  Particle(float locx, float locy, float velx, float vely) {
    super(locx, locy, velx, vely);
    particleColor = color(250, random(60, 250), 0);
    timer = 80;
    timerValue = timer;
  }

  Particle(float locx, float locy, float velx, float vely, int timr) {
    super(locx, locy, velx, vely);
    particleColor = color(250, random(60, 250), 0);
    timer = timr;
    timerValue = timer;
  }

  void show() {
    drawParticles();
  }

  void drawParticles() {
    pushMatrix();
    translate(loc.x, loc.y);
    noStroke();
    fill(particleColor, map(timer, timerValue, 0, 255, 0));

    rect(0, 0, 7, 7);

    popMatrix();
  }

  void act() {
    loc.add(vel);
    timer--;

    if (timer == 0) lives = 0;
  }
}
