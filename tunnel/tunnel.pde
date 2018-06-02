import peasy.*;
PeasyCam cam;
float scl=10;
float da=scl/100;

void setup(){
  cam=new PeasyCam(this,500);
  size(600,600,P3D);
  background(0);
}
void draw(){
  //background(0,0,0);
  translate(-300,-300);
  pointLight(255,255,255,300,300,400);
  fill(236,66,244);
  //for(float y=200;y<600;y+=200){
  for(float z=600+da;z>-1000+da;z-=scl){
    //for(float x=200;x<400;x+=scl){
      for(float a=0;a<TWO_PI;a+=0.2){
        float x=300+20*cos(a);
        float y=300+20*sin(a);
    pushMatrix();
    
    translate(x,y,z);
    box(scl);
    popMatrix();
    
    }
 // }
  

  }
  da-=0.1;
}