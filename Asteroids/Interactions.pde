void mouseReleased() {
  if (mode == INTRO) introClicks();
  else if (mode == GAME) gameClicks();
  else if (mode == PAUSE) pauseClicks();
  else if (mode == GAMEOVER) gameOverClicks();
}
void keyPressed() {
  if (key == 'w' || key == 'W' && mode == GAME) upkey = true;
  if (key == 's' || key == 'S' && mode == GAME) downkey = true;
  if (key == 'a' || key == 'A' && mode == GAME) leftkey = true;
  if (key == 'd' || key == 'D' && mode == GAME) rightkey = true;
  if (key == ' ' && mode == GAME) spacekey = true;
  if (key == 'f' || key == 'F' && mode == GAME) tpkey = true;
}
void keyReleased() {
  if (key == 'w' || key == 'W' && mode == GAME) upkey = false;
  if (key == 's' || key == 'S' && mode == GAME) downkey = false;
  if (key == 'a' || key == 'A' && mode == GAME) leftkey = false;
  if (key == 'd' || key == 'D' && mode == GAME) rightkey = false;
  if (key == ' ' && mode == GAME) spacekey = false;
  if (key == 'f' || key == 'F' && mode == GAME) tpkey = false;
}
