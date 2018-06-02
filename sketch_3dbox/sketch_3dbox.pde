float px=300,py=00,pz=-200;
float dx,dy,dz;
float q=100,w=10,e=20;
void setup(){
  size(600,600,P3D);
  dx=random(-2,2);
  dy=random(-0.5,1);
  dz=random(-2,2);
  frameRate(500);
  background(0);
}

void draw(){
  // background(00,0,20);
   float r=map(noise(q),0,1,00,255);
   float g=map(noise(w),0,1,00,255);
   float b=map(noise(e),0,1,00,255);
   
   stroke(r,g,255,100);
   q+=0.5;
   w+=0.2;
   e+=0.7;
   // fill(134,66,244,100);
   strokeWeight(0.2);
   noFill();
   translate(px,py);
   float x=map(px,0,600,0.5,2);
   float y=map(py,0,600,0.5,2);
   float z=map(pz,-300,0,0.5,2);
   rotateX(PI/x);
   rotateY(PI/y);
  // rotateZ(PI/z);
   px+=dx;
   py+=dy;
   pz+=dz;
   if(px>600||px<0){
   dx=-dx;
   }
   if(py>600||py<0){
   dy=-dy;
   }
   if(pz>0||pz<-300){
   dz=-dz;
     
   }
   //sphere(100);
   box(50,50,100);

}