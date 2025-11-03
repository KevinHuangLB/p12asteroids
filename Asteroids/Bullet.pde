class Bullet extends GameObject{

  int timer;

  Bullet() {
    super(player1.loc.copy(),player1.dir.copy());
    //vel = new PVector(mouseX - loc.x, mouseY - loc.y); // Aim with mouse rather than spaceship
    vel.setMag(25);
    timer = 20;
    d = 10;
  }
  Bullet(float lx, float ly, float lx2, float ly2){ // FINISH BULLET CONSTRUCTOR!!!
    
  }
 
  void show() {
    fill(black);
    stroke(white);
    strokeWeight(2);
    circle(loc.x, loc.y, d);
  }
  
  void act(){
   loc.add(vel); 
   timer--;
   if (timer == 0) lives = 0;
   wrapAround();
  }
}
