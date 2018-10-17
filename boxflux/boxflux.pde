import processing.sound.*;
import peasy.*;
PeasyCam cam;
Amplitude amp;
AudioIn in;
SoundFile file;

int n=50;
int nz=50;
PVector [][] pos=new PVector[n][nz];
PVector [][] dim=new PVector[n][nz];
PVector [][] lin=new PVector[n][nz];

void setup() {
  size(600, 600, P3D);
  background(0);

  String ncs="Acejax feat. Danilyon - By My Side.mp3";
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\"+ncs);
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);

  for (int x=0; x<n; x++) {
    for (int z=0; z<nz; z++) {

      float pz=map(z, 0, nz, 500, -1000);
      pos[x][z]=new PVector(random(600), random(380, 420), pz);
      dim[x][z]=new PVector(random(100), random(110), random(100));
      float sx=map(noise(x), 0, 1, 0, 600);
      lin[x][z]=new PVector(sx, 400, pz);
    }
  }
}
float da=0;
float inc=5;
void draw() {
  background(0);
  translate(300,300);
  
  rotate(da);
  translate(-300,-300);
  float c=255;
  directionalLight(c, c, c, 0, 1, 1);
  directionalLight(c, c, c, 0, -1, 1);
  
  
  if (random(1)>0.7)
    pointLight(c, c, c, 300, 300, -500+frameCount%1000);
  noStroke();
  fill(10);

  float cam=map(noise(da), 0, 1, 0, 50);

  float camx=map(noise(da), 0, 1, -50, 50);
  pushMatrix();
  translate(camx, cam);
  boxes();

  translate(camx, -300+cam);
  boxes();
  popMatrix();

  pushMatrix();
  rotate(PI/2);
  translate(camx, -300+cam);
  boxes(); 
  popMatrix();

  pushMatrix();
  rotate(3*PI/2);
  translate(-500+camx, 300+cam);

  boxes(); 
  popMatrix();



  inc=lerp(inc, 15, 0.1);
  if (inc>14)
    inc=3;

  da+=0.01;
}









void boxes() {
  for (int x=0; x<n; x++) {
    for (int z=0; z<nz; z++) {

      
      fill(25);
      
      PVector a=pos[x][z];
      PVector d=dim[x][z];

      pushMatrix();
      translate(a.x, a.y, a.z);
      float lx=map(noise(a.x, a.z), 0, 1, 0, 110);
      float ly=map(noise(a.x, a.z), 0, 1, 0, 110);

      boxx(d.x, d.y, d.z);
      popMatrix();

      pos[x][z].z+=amp.analyze()*700;

      if (a.z>600) {
        float pz=map(z, 0, nz, 500, -500);
        pos[x][z]=new PVector(random(600), 400, -1000);
        dim[x][z]=new PVector(random(100), random(110), random(100));
      }
    }
  }
}

void boxx(float l, float b, float h) {
  box(l, b, h);
  fill(66, 166, 255);
  pushMatrix();
  translate(0, 0);
  box(1, b+5, h+5);
  popMatrix();
}
