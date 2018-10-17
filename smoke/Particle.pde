class Particle{
  
  PVector pos,vel,acc;
  
  
  Particle(PVector p, PVector v, PVector a){
    pos=p;
    vel=v;
    acc=a;
  }
   
  void update(){
    
    pos.add(vel);
    vel.add(acc);
    
  }
  boolean isDead(){
    if(pos.x>600 || pos.y<0){
      return true;
    }
    return false;
  }
  
  void display(){
    noStroke();
    fill(255,100);
    ellipse(pos.x,pos.y,50,50);
    
  }



}
