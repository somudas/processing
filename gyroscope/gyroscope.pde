void setup() {
  size(600, 600, P3D);
  background(0);
}
float da=0;
float daa=1;
void draw() {
  background(0);
  fill(255);
  translate(300, 300);
  directionalLight(255,255,255,1,1,-1);
  for (float r=50; r<200; r+=30) {
    rotateZ(da/100);
    rotateX(da/150);
    
    for (float a=0; a<TWO_PI; a+=0.1) {
      float x=(log(log(a+1))*r);
      float y=sin(a)*r;
      pushMatrix();
      translate(x,y);
      box(10);
      popMatrix();
    }
  }
  da+=daa;
  if (da>60 || da<0) {
  //daa=-daa;
  }
}
