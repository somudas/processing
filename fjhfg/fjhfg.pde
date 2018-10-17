void setup() {
  size(600, 600, P3D);
  background(0);
  frameRate(20);
}
float da=0;
void draw() {
  background(0);
  stroke(25,65,255);
  strokeWeight(5);
  
  for (int i=1; i<5; i++) {
    for (float a=0; a<TWO_PI; a+=0.01) {
      float r=map(noise(sin(da*a-da*da),cos(da*da+da*sin(a))), 0, 1, i*20, i*20+30);
      println(r,da);
      float x=300+cos(a)*r;
      float y=300+sin(a)*r;
      point(x, y);
      da+=0.01;
    }
  }
}
