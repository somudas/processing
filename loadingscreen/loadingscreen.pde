void setup(){
  size(600,600);
  background(0);
}
float cx=260,cy=200;
float a=0;
void draw(){
  background(0);
  stroke(255);
 
  
 
  
  float x=300-40;
  
  
  for(int i=0;i<5;i++){
     strokeWeight((1+sin(a+x))*10);
    point(x,300);
    x+=20;
  }
  cy=sin(a)*10+300;
  //point(cx,cy);
  a+=1/PI;
  
  
}
