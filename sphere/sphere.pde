import peasy.*;
PeasyCam cam;
void setup(){
  size(600,600,P3D);
  //noLoop();
  cam=new PeasyCam(this,500);
}
float r=150;
float k=0.01;
float r1=0.005,r2=0.5;
float dr=0.0005;
void draw(){
  background(0,0,0);
  //pointLight(25,5,55,0,300,-100);
  stroke(66,134,244);
  noFill();
  strokeWeight(2);
  //translate(300,300);
  for(float i=0;i<PI;i+=r1){
    for(float j=0;j<TWO_PI;j+=r2){
      float x=cos(j)*r;
      float y=sin(j)*r;
      float x1=cos(j)*(r+0.1);
      float y1=sin(j)*(r+0.1);
      
      //if(random(2)>1.5){
      pushMatrix();
      translate(x,y);
      box(1);
      popMatrix();
      //line(x,y,x1,y1);
    //}
    }
    rotateY(i);
  }
  r1+=dr;
  if(r1>0.05){
    dr=-dr;
  }
  if(r1<0.005){
    dr=-dr;
  }
  
  r2=r1/k;
  
}