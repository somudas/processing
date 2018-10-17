import peasy.*;

PeasyCam cam;

void setup(){
  size(600,600,P3D);
  background(0);
  cam=new PeasyCam(this,500);
}
float da=0;
void draw(){
  background(0);
  
 // translate(300,300);
  stroke(255);
  float r=50,lim=150;
  //directionalLight(255,155,55,0,1,1);
  //noStroke();
  fill(255);
  
  for(float the=0;the<PI;the+=0.1){
    for(float omg=0;omg<2*PI;omg+=0.1){
      float x=r*sin(the)*cos(omg);
      float y=r*sin(the)*sin(omg);
      float z=r*cos(the);
      
      r=map(noise(x,y,z),0,1,0,lim);
      
      x=r*sin(the)*cos(omg);
      y=r*sin(the)*sin(omg);
      z=r*cos(the);
      pushMatrix();
      translate(x,y,z);
      point(0,0,0);
      popMatrix();
      //point(x,y,z);
    }
  }
  da+=0.000001;
}
