class Bubble{
  float x,y;
  float s;
  PVector vel;
  Bubble(float _x,float _y,float _s){
    s=_s;
    x=_x;
    y=_y;
    vel=new PVector(random(-1,1),random(-s/2,0));
  
  }
  
  void update(){
    if(x>0 && x<600)
      x+=vel.x;
    if(y>200)
    y+=vel.y;
    
  
  }
  void display(){
    ellipse(x,y,s,s);
  
  }


}
