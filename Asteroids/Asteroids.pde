// Kevin Huang
// 2-4


import processing.javafx.*;
import java.util.ArrayList;

// Color pallette
color black = #000000;
color white = #FFFFFF;
color red = #DD0000;
color green = #9fee98;

// Mode framework
int mode;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

// keyboard variables
boolean upkey, downkey, leftkey, rightkey, spacekey;

// game variables
PVector loc;
PVector vel;
PVector gravity;

float d;

// bullet variables
boolean shotByPlayer;

//game objects
Spaceship player1;

//List of bullets
ArrayList<GameObject> objects;

//UFO variables
float ufoPos;
int count;

void setup() {
  size(1000, 1000, FX2D);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  frameRate(60);

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

  //ufo objects
  //if (count % 100 == 0) {
  //  if (ufoPos < 1) objects.add(new UFO(0, random(1000), 6, 0));
  //  if (ufoPos < 2 && ufoPos > 1) objects.add(new UFO(1000, random(1000), -6, 0));
  //  if (ufoPos < 3 && ufoPos > 2) objects.add(new UFO(random(1000), 0, 0, 6));
  //  if (ufoPos > 3) objects.add(new UFO(random(1000), 1000, 0, -6));
  //}


  mode = GAME;
}
void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
