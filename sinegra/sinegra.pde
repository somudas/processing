void setup(){
  size(600,600);
  noLoop(); 
}
void draw(){
  background(170, 186, 239);
  stroke(255);
  noFill();
  float a=0;
  float q=1;
  for(int i=0;i<5;i++){
    stroke(random(255),random(255),random(255));
  for(float x=50+random(25);x<550;x+=q){
    float s=map(sin(a),-1,1,350,250);
    float w=map(sin(a+0.1),-1,1,400,200);
    line(x,s,x+q,w);
    //ellipse(x,s,1,1);
    a+=0.1;
  }
  q=random(0.5,3);
}
}