void setup() {
  size(600, 600, P3D);
  background(0);
  frameRate(10);
}
float da=0;
void draw() {
  background(0);
  noStroke();
  rotateX(PI/5);
  directionalLight(255,255,255,0,-1,1);
  fill(200,100,20);
  fill(255);
  translate(300, 300);
  float r=10;
  for (float a=0; a<40; a+=0.01) {
    float x=sin(a)*r;
    float y=cos(a)*r;
    r=map(a, 0, 40, 0, 150);
    pushMatrix();
    translate(x, y);
    float s=(sin(da)+1)*50;
    box(10, 10, s);
    popMatrix();

    da+=176;
    if (keyPressed)
      println(mouseX);
  }
}
