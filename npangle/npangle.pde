void setup(){
  size(600,600,P3D);
  background(0);
  frameRate(1000);
}
float i=10,ix=10;
float nx=0;
float x=0,y=300;
void draw(){
  //background(0);
  lights();
  translate(0,100);
  translate(x,y,-nx);
  float a=map(noise(nx),0,1,-PI,PI);
  rotate(a);
  strokeWeight(0.5);
  stroke(66,134,244,100);
  line(0,0,0,i,i,-nx);
  if(x>600 || x<0)
    ix=-ix;
  if(y<0 || y>600)
    i=-i;
    
  x+=ix;
  if(a>0)
    y+=i;
   else
     y-=i;
  nx+=0.51;
}