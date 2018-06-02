class Balls{
PVector pos;
float r=0;
Balls(PVector e,float w){
  pos=e.get();
  r=w;
}
void update(){
 
  float a=0;
  ellipse(pos.x,pos.y,r*2,r*2);
  stroke(255);
  noFill();
  for(a=PI/2;a>-PI/2;a-=0.01){
    float x=pos.x+cos(a)*r;
    float y=pos.y+sin(a)*r;
    line(x,y,x+random(100),y);
  }
}



}