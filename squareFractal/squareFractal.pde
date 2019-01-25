void setup(){
  size(600,600,P3D);
  background(0);
  rectMode(CENTER);
}

float angle=0;
float da=0;
float sw=1000;

void draw(){

  translate(300,300,da);
  rotate(da);
  rotateX(da);

  noStroke();
  
  fill(255);
  if(frameCount%2==0)
    fill(0);
  
  rect(0,0,sw,sw);
  
  da=lerp(da,angle,0.05);
  if(angle-da<0.1){
    sw = sw/sqrt(2);
    angle+=PI/2;
  }
  
}
