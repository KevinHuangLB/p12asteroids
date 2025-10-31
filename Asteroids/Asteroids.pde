// Kevin Huang
// 2-4


import processing.javafx.*;
import java.util.ArrayList;

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
boolean upkey, downkey, leftkey, rightkey, spacekey;

// game variables
PVector loc;
PVector vel;
PVector gravity;

float d;

//game objects
Spaceship player1;

//List of bullets
ArrayList<GameObject> objects;

//UFO variables
float ufoPos;


void setup() {
  size(1000, 1000, FX2D);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

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
  if (frameCount % 1000 == 0) {
    if (ufoPos < 1) objects.add(new UFO(0,random(1000), 1));
    if (ufoPos < 2 && ufoPos > 1) objects.add(new UFO(1000, random(1000), 2));
    if (ufoPos < 3 && ufoPos > 2) objects.add(new UFO(random(1000),0,3));
    if (ufoPos > 3) objects.add(new UFO(random(1000),1000,4));
    // FDUCKING FIX THIS SHIT YOU IDIOT THIS SHIT DOES NOT WORK
    // ADD A CONSTRUCTOR ARGUMENT WHERE YOU JUST WRITE OUT THE VELOCITY VALUE
  }

  mode = GAME;
}
void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
