PVector [] colors = new PVector[5];

void setup() {
  size(600, 600, P3D);
  background(0);


  colors[0] = new PVector(11, 199, 177);
  colors[1] = new PVector(241, 240, 226);
  colors[2] = new PVector(217, 187, 116);
  colors[3] = new PVector(242, 86, 82);
  colors[4] = new PVector(5, 69, 73);
}
float da=0;
void draw() {
  background(0);
  pointLight(255, 255, 255, 300, 300, 0);
  directionalLight(255, 255, 255, 0, 0, -1);
  translate(300, 300);
  //rotateX(PI/2.5);
  translate(-300, -300);
  noStroke();
  translate(300, 300);
  float r = noise(da)*80;
  r = 50;
  float off = 0;
  for (int i=0; i<10; i++, r+=50) {

    off = da;
    for (float a=0; a<TWO_PI; a+=0.01) {
      
      PVector c = colors[(int)i%5];
      float col = map(noise(a+off), 0, 1, 0, 255);
      fill(c.x, c.y, c.z, 100);

      float x=cos(a)*r;
      float y=sin(a)*r;
      float d=noise(da/10)*100;
      float rP=map(noise(x/d+off,y/d+off),0,1,r-d,r+d);
      x=cos(a)*rP;
      y=sin(a)*rP;


      //r = col;
      
      pushMatrix();
      rotate(a);
      translate(0,r);
      rotateX(sin(a)*cos(off)*off);
      rotateY(cos(off));

      box(5, 50, 5);
      popMatrix();
      off+=0.00001;
    }
  }
  da = off;
  da+=0.001;
}
