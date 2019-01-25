void setup() {
  size(600, 600, P3D);
  background(0);
}
float da=0;
float rot=0;
float dr=6.28;
void draw() {
  background(0);

  translate(300, 300);
  pointLight(255, 255, 255, 300, 300, 300);
  float r=100;
  float siz=20;
  noStroke();
  float xoff=da;
  rotate(da/1000);
  //rotateY(da/1000);
  
  rot=lerp(rot, da, 0.01);
  for (float z=1500; z>-2000; z-=siz) {

    for (float a=0; a<TWO_PI; a+=0.1) {
      float x=cos(da+a)*r;
      float y=sin(a)*r;

      r=map(noise(x, y, z), 0, 1, 100, 500);

      x=sin(a)*cos(a)*r;
      y=sin(a)*tan(a)*r;

      pushMatrix();
      rotate(a);
      rotateY(a);
      float f=map(a,0,TWO_PI,100,205);
      fill(f,f*1.2,f*1.5);
      
      translate(x-rot, y+rot, z+rot);
      rotateX(da);
      box(siz);
      popMatrix();
    }
    da+=0.1;
  }
  
  if (da>1500)
    da*=-1;
}
