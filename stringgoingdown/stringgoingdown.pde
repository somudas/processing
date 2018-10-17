import peasy.*;
PeasyCam cam;
void setup(){
  size(600,600,P3D);
  background(0);
  cam=new PeasyCam(this,500);
  frameRate(500);
}
float da=0,dda=1;
void draw(){
  translate(-300,-300);
  background(20);
  
  strokeWeight(5);
  stroke(255);
  noFill();
  beginShape();
  float r=0;
  for(float a=da;a<dda;a+=0.1){
     float x=cos(a)*cos(a-1)*r+300;
     float z=tan(noise(tan(a+1))*6.28)*r+300;
     
     float y=map(a,da,dda,400,50);
     float f=map(sin(a),-1,1,40,250);
     
     stroke(f);
     vertex(x,y,z);
     r+=0.1;
  }
  endShape();
  da+=0.1;
  dda+=0.2;

}
