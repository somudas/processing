
float x=0;
void setup(){
  size(600,600);
  background(0);
  
}

void draw(){
  noStroke();
  fill(66,134,244,100);
  for(int i=0;i<10;i++){
  float y=map(noise(x),0,1,100,500);
  rect(x,y,3,10);
  x+=0.1;
  }
}