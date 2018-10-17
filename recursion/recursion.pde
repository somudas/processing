import processing.sound.*;

Amplitude amp;
AudioIn in;
SoundFile file;


float dx=0, dy=0;

void setup() {
  size(600, 600, P3D);
  background(255);
  
  String ncs="Raven & Kreyn - Biscuit (Extended Mix).mp3";
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\"+ncs);
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float r=100, pr;
float ur=50+r;
float f=255;
boolean fl=true;
float zm=0;
void draw() {
  background(f);
 
  translate(0, 0, zm);
  fill(255-f);
  f=fl?255:0;

  pr=r;
  r=lerp(r, ur, 0.001);
  oval(300, 300, r, r);

  if (ur-r<1) {
    ur+=random(20);
  }
  zm+=amp.analyze()*100+0.5;
  if (zm>480) {
    init();
  }
}

void init() {
  zm=0;
  r=100;
  pr=100;
  ur=50+r;
  f=255;
  
  fl=!fl;
}

void oval(float _x, float _y, float r, float r2) {
  beginShape();
  for (float a=0; a<TWO_PI; a+=0.1) {
    r=map(noise(sin(a)*r+dx, cos(a)*r+dy), 0, 1, 0, r2);

    float x=cos(a)*r2+_x;
    float y=sin(a)*r2+_y;

    r=map(noise(x+dx, y+dy), 0, 1, 0, r2);

    x=cos(a)*r+_x;
    y=sin(a)*r+_y;




    vertex(x, y);
  }
  dx+=amp.analyze()/10000;
  dy+=amp.analyze()/10000;
  endShape();
}
