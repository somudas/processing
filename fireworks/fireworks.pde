

Blast b=new Blast();

void setup() {
  size(600, 600, P3D);
  background(0);
}
float da=0;
void draw() {
  //background(0);
  //stroke(0);
  noStroke();
  directionalLight(255, 255, 255, -1, 0, -1);
  translate(300, 300);
  rotateY(sin(da)*da*0.01);
  rotateX(-da);
  rotateZ(da+1);

  translate(-300, -300);
  b.show();
  if (frameCount%100==0) {
    b=new Blast();
    background(0);
  }

  da+=0.01;
}
