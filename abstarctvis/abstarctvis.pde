import processing.sound.*;
import peasy.*;
PeasyCam cam;
Amplitude amp;
AudioIn in;
SoundFile file;

int n=55;

ArrayList<PVector>ps=new ArrayList<PVector>();
void setup() {
  size(600, 600, P3D);
  cam=new PeasyCam(this,500);
  background(0);
  for (int i=0; i<n; i++) {
    float x=random(200, 400);
    PVector s=new PVector(x, random(200, 400),random(-10, 10));
    ps.add(s);
  }
 String ncs="Twenty_One_Pilots_-_My_Blood_makhits.com.mp3";
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\"+ncs);
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

float dx=0;
void draw() {
  
//  println(amp.analyze());
  translate(-300,-300);
  background(0);
  float am=amp.analyze()*4000;
  noStroke();
  beginShape();
  for (int i=0; i<n; i++) {
    PVector a=ps.get(i);
    float f=map(i, 0, n, 0, 255);
    fill(f, f/2, f/1.2);
    vertex(a.x, a.y);
  }
  endShape();
  
  am+=50;
  
  //am=map(noise(dx),0,1,0,150);
  float x=random(300-am, 300+am);
  

  PVector a=new PVector(x, random(300-am, 300+am),random(-am, am));
  ps.add(a);
  ps.remove(0);
  
  dx+=amp.analyze()*100;
}
