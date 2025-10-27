class UFO extends GameObject {


  UFO(float lx, float ly) {
    super(lx, ly, 1, 0);
  }

  void act() {
  }

//  void checkForCollisions() {
//    int i = 0;
//    while (i < objects.size()) {
//      GameObject obj = objects.get(i);
//      if (obj instanceof Bullet) {
//        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
//          objects.add(new Asteroid(loc.x, loc.y, lives - 1));
//          objects.add(new Asteroid(loc.x, loc.y, lives - 1));
//          lives = 0;
//          obj.lives = 0;
//        }
//      }
//      i++;
//    }
//  }

  //void borders() {
  //  if (loc.x > width) {
  //    loc.x = 0;
  //  }
  //  if (loc.x < 0) {
  //    loc.x = width;
  //  }
  //  if (loc.y > height) {
  //    loc.y = 0;
  //  }
  //  if (loc.y < 0) {
  //    loc.y = height;
    
  //}
}
