import peasy.*;
PeasyCam cam;

float n=40;
void setup(){
  size(600,600,P3D);
  background(0);
  frameRate(100);
  //cam= new PeasyCam(this,500);
}
float d=0;
void draw(){
   background(3);
   fill(94,6,196);
   
   translate(00,500);
   //pointLight(134,55,255,100,750,500);
   float xoffset=d;
   for(int qx=-900;qx<1400;qx+=n){
     float yoffset=0;
     for(int qy=-350;qy<1700;qy+=n){
       pushMatrix();
       
       float x=map(noise(yoffset,xoffset),0,1,-PI,PI);
       float y=map(noise(yoffset,xoffset),0,1,-PI,PI);
       float z=map(noise(yoffset,xoffset),0,1,-PI,PI);
       
       translate(qx,y*50,-qy);
       
       rotateX(x);
       rotateY(y);
       rotateZ(z);
       box(n,1,n);
       popMatrix();
       yoffset+=0.02;
     }
     xoffset+=0.02;
   }
   d+=0.007;

}
