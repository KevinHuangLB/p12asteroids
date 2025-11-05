void gameClicks() {
  vel.setMag(vel.mag() + 1);
}
void game() {
  background(black);
  count++;

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

  if (count % 500 == 0) {
    if (ufoPos < 1) objects.add(new UFO(0, random(100,900), 6, 0));
    if (ufoPos < 2 && ufoPos > 1) objects.add(new UFO(1000, random(100,900), -6, 0));
    if (ufoPos < 3 && ufoPos > 2) objects.add(new UFO(random(100,900), 0, 0, 6));
    if (ufoPos > 3) objects.add(new UFO(random(100,900), 1000, 0, -6));
  }
}
