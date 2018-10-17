import processing.sound.*;
import peasy.*;
PeasyCam cam;
Amplitude amp;
AudioIn in;
SoundFile file;


int n=400;
PVector [] pos=new PVector[n];
PVector vel[]=new PVector[n];
PVector [] acc=new PVector[n];

void setup() {
  size(600, 600, P3D);
  background(0);

  for (int i=0; i<n; i++) {
    pos[i]=new PVector(300, 300, -300);
    float d=5;
    vel[i]=new PVector(random(-d, d), random(-d, d), random(-d, d));
    acc[i]=PVector.mult(vel[i], 0.01);
  }

  String ncs="3rd Prototype - Feel So Good (Radio Edit).mp3";
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\"+ncs);
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float da=0;
void draw() {
  background(0);
  pointLight(255, 255, 255, 300, 300, 0);
  noStroke();
 
  fill(255, 150, 50);
  translate(10, 0, -500);
  for (int i=0; i<n; i++) {
    PVector a=pos[i];
    //stroke(255);
    //strokeWeight(5);


    float xo=map(noise(da), 0, 1, -6.28, 6.278);
    float yo=map(noise(da+1000), 0, 1, -6.28, 6.28);
    PVector sp=PVector.mult(vel[i], amp.analyze()*100);
    float red=map(abs(a.z-300), 0, 500, 0, 255);
    //fill(red,150,250);
    pushMatrix();
    translate(300, 300);
    rotateX(xo);
    rotateY(yo);
    translate(-300, -300);
    translate(a.x, a.y, a.z);
    
    box(40);
    popMatrix();
    pos[i].add(sp);
    vel[i].add(acc[i]);


    if (pos[i].z>400 || a.z<-800) {
      pos[i]=new PVector(300, 300, -300);
      float d=5;
      vel[i]=new PVector(random(-d, d), random(-d, d), random(-d, d));
      acc[i]=PVector.mult(vel[i], 0.0100);
    }
  }
  float am=map(amp.analyze(), 0, 10, 0, 5);
  da+=am;
}
