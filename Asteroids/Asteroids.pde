import processing.javafx.*;


// Color pallette
color black = #000000;
color white = #FFFFFF;
color red = #DD0000;

// Mode framework
int mode;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

// keyboard variables
boolean upkey, downkey, leftkey, rightkey;

// game variables
PVector loc;
PVector vel;
PVector gravity;

float d;


void setup() {
  size(1000, 1000,FX2D);


  d = 100;
  
  loc = new PVector(width/2,height/2);
  
  vel = new PVector(5,0);
  vel.rotate(radians(random(0,360)));
  
  gravity = new PVector(0,1);

  mode = GAME;
}
void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
