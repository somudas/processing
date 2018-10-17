void setup(){
  size(600,600);
  background(255,171,154);
}
float da=0,dda=0.01;
void draw(){
  background(254);
  noStroke();
  fill(201,116,298,100);
  float offset=da;
  for(float x=0;x<600;x++){
    float y=map(noise(offset),0,1,400,500);
    rect(x,y,1,600-y);
    offset+=0.01;
  }
  if(da>1.2 || da<0){
    dda=-dda;
    da=-da;
  }
  da+=dda;
 
}
