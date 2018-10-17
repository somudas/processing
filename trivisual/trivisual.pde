void setup(){
  size(600,600);
  background(0);
}
void draw(){
  background(0);
  stroke(255);
  for(float a=0;a<random(6.28);a+=0.1){
    float x=cos(a)*100+300;
    float y=sin(a)*100+300;
    
    line(400,300,200,300);
    line(400,300,x,y);
    line(200,300,x,y);
    
    
    
  }
  
}
