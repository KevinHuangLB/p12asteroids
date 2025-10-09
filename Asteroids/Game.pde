void gameClicks(){
  vel.setMag(vel.mag() + 1);
}
void game(){
  background(black);
  player1.show();
  player1.act();
  
  //circle(loc.x,loc.y,d);
  
  //loc.add(vel);
  //vel.add(gravity);
  
  //if (loc.y < d/2 || loc.y > height - d/2) vel.y = -0.9 * vel.y;
  //if (loc.x < d/2 || loc. x > width - d/2) vel.x = -0.9 * vel.x;
}
