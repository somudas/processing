import peasy.*;
PeasyCam cam;


void setup(){
  size(600,600,P3D);
  background(0);
  frameRate(200);
  //cam=new PeasyCam(this,100);
}
float np=0;
void draw(){
  background(13,6,24);
  noFill();
  strokeWeight(20);
  //np+=0.01;
  translate(0,300);
  translate(0,0,100);
  float a=0;
  float nop=np;
  float ae=map(noise(nop),0,1,PI/2,-PI/02);
 // pointLight(134,66,255,300,0,300);
  rotateY(ae/10);
  for(float z=700+a;z>-1000+a;z-=50){
    float angle=map(noise(nop),0,1,PI/2,-PI/02);
    float x=map(noise(nop),0,1,200,400);
    float y=map(noise(nop),0,1,350,450);
    pushMatrix();
    translate(x,y-400,z);
    rotateY(angle);
    float st=map(z,500,-1000,255,0);
    float sw=map(x,500,-1000,7,0);
    strokeWeight(sw);
    stroke(66,st-50,255,st);
    rectMode(3);
    //box(100,100,100);
    rect(0,100,150,1);
    //rect(-50,100,5,1);
    //rect(50,100,5,1);
    
    popMatrix();
    nop+=0.1;
  }
   np+=0.005;
   //a-=10;
}
