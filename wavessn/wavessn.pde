import peasy.*;
PeasyCam cam;
void setup(){
  size(600,600,P3D);
  background(0);
  //cam= new PeasyCam(this,500);
}
float aoff=0;
void draw(){
  
  float a=20;
  float b=random(30);
  float c=50;
  
  
  
  background(0,1,random(10));
  stroke(0);
  fill(random(134),random(55),255);
  float angle=aoff;
  for(float z=00;z>-5000;z-=50){
  pushMatrix();
  float y=map(sin(angle),-1,1,450,250);
  float y2=map(cos(angle),-1,1,450,250);
  fill(244,66,134);
  translate(0,y,z);
  box(a,b,c);
  popMatrix();
  
  pushMatrix();
  translate(600,y,z);
  box(a,b,c);
  popMatrix();
  
  pushMatrix();
  translate(y,0,z);
  box(a,b,c);
  popMatrix();
  
  pushMatrix();
  translate(y2,600,z);
  box(a,b,c);
  popMatrix();
  
  fill(66,134,255);
  
  pushMatrix();
  translate(0,y2,z);
  box(a,b,c);
  popMatrix();
  
  pushMatrix();
  translate(600,y2,z);
  box(a,b,c);
  popMatrix();
  
  pushMatrix();
  translate(y2,0,z);
  box(a,b,c);
  popMatrix();
  
  pushMatrix();
  translate(y,600,z);
  box(a,b,c);
  popMatrix();
  
  
  
  angle+=0.1;
  }
   aoff+=0.1;
   
}
