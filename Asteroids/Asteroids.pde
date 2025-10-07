
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
boolean upkey,downkey,leftkey,rightkey;


void setup(){
  size(1000,1000);
  
  mode = INTRO;
}
void draw(){
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameOver();
}
