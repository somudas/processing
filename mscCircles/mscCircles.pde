void setup(){
  size(600,600,P3D);
  background(0);
}
float da=0,dev=0;
void draw(){
  background(0);
  noStroke();
  fill(255);
  translate(300,300);
  for(int z=500;z>-00;z-=10){
    float deviate=map(noise(dev),0,1,-50,50);
    pushMatrix();
    translate(deviate,0);
    for(float a=0;a<2*3.14;a+=0.1){
      float max=map(noise(da),0,1,0,5);
      float x=sin(a)*50;
      float y=cos(a)*50;
      pushMatrix();
      translate(x+deviate,y,z);
      float al=map(sin(a+3*PI/2),-1,1,0,255);
      fill(al);
      ellipse(0,0,max,max);
      popMatrix();

      da+=0.001;
    }
    popMatrix();
   dev+=0.001;
  
  }
}
