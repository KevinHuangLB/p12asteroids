void gameOverClicks() {
  mode = INTRO;
  lives = 3;

  d = 100;

  loc = new PVector(width/2, height/2);

  vel = new PVector(5, 0);
  vel.rotate(radians(random(0, 360)));
  gravity = new PVector(0, 1);
  ufoPos = random(4);

  //player variable
  objects = new ArrayList();
  player1 = new Spaceship();
  objects.add(player1);
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());

  upkey = false;
  downkey = false;
  leftkey = false;
  rightkey = false;
  tpkey = false;
  spacekey = false;
}
void gameOver() {
  background(black);
  textSize(80);
  if (player1.lives == 0) {
    fill(red);
    text("YOU LOST!", 500, 400);
    text("Click to restart", 500, 600);
  }
  if (player1.killCount == 21){
    fill(lightGreen);
    text("YOU WIN!", 500, 400);
    text("Click to restart", 500, 600);
  }
}
