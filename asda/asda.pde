void setup() {
  size(600, 600, P3D);
}
float dx=0;

float dy=0;
void draw() {
  background(255);
  float ay=map(frameCount/2, 0, 600, -TWO_PI, TWO_PI);
  float s=30;
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {
        dx -= 0.01;
      } else if (keyCode == DOWN) {
        dx += 0.01;
      } else if (keyCode == LEFT) {
        dy += 0.01;
      } else if (keyCode == RIGHT) {
        dy -= 0.01;
      }
    }
  }
 
  
  rectMode(3);
  directionalLight(255, 255, 255, -1, 1, 0);
  translate(300, 500);
  rotateX(PI/2.5);
  rotateZ(ay);
  translate(0, -600, 200);
  noStroke();
  fill(85, 55, 255);
  float xoffset=dx;
  for (int x=-1300; x<900; x+=s) {
    float yoffset=dy;
    for (int y=-100; y<1600; y+=s) {
      pushMatrix();
      translate(sin(x)*x, sin(y)*y);
      float a=map(noise(xoffset, yoffset), 0, 1, 10, 250);
      if (a>180)
        fill(200, 55, 10);
      else if (a>120)
        fill(20, 200, 125);
      else if (a>30) {
        fill(55, 155, 255);
        a=30;
      }
       fill(255);
      box(s, s, a);

      popMatrix();
      yoffset+=0.1;
    }
    xoffset+=0.1;
  }
  dx+=.01;
  dy+=0.01;
}
