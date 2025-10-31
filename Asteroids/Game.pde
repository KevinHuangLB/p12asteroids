void gameClicks() {
  vel.setMag(vel.mag() + 1);
}
void game() {
  background(black);

  int i = 0;
  while (i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.show();
    currentObject.act();
    if (currentObject.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
}
