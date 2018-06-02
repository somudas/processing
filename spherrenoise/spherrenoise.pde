import peasy.*;
PeasyCam cam;
float r=150;

void setup(){
  size(600,600,P3D);
  background(0);
  cam=new PeasyCam(this,500);
}
float xx=100,yy=1;
void draw(){
  background(0);
  stroke(255);
  
  for(float i=0;i<TWO_PI;i+=0.1){
    pushMatrix();
    rotateY(i);
    for(float j=0;j<TWO_PI;j+=0.1){
      pushMatrix();
      float x=cos(j)*r;
      float y=sin(j)*r;
      translate(x,y);
      rotate(j);
      float h=map(noise(xx,yy),0,1,0,100);
      line(0,0,h,0);
      popMatrix();
      xx+=0.1;
    }
    popMatrix();yy+=0.1;
  }
}