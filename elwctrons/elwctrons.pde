import peasy.*;
PeasyCam cam;
void setup() {
  size(600, 600, P3D);
  background(0);
  colorMode(HSB);
  cam=new PeasyCam(this,500);
}
float da=0;
void draw() {
  background(0);
  directionalLight(0, 0, 255, 1, 1, -1);
  noStroke();
  fill(255);
  float r=0;
 
  //translate(300, 300);
  rotateZ(da);
  for (int i=1; i<=10; i++) {
    pushMatrix();
    fill((da*i+100)%255,1,255);
     sphere(5);
    rotateY(-da+i);
    rotateX(da+i);
    rotateZ(-da/2*i);
    rotate(da);

    for (float a=da; a<=6.28+da-1; a+=0.1) {
      r=atan(a)*i*10;
      float x=sin(a+0.1)*r;
      float y=cos(a)*r;
      pushMatrix();
      translate(x, y);
      if(a>6.28+da-1.1)
        box(r/10);
      box(r/50);
      popMatrix();
    }
    popMatrix();
  }
  da+=0.01;
}
