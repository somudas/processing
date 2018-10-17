
import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;


int n=103;

ArrayList<Rain> rain=new ArrayList<Rain>();
void setup() {
  size(600, 600, P3D);
  for (int i=0; i<n; i++) {
    Rain r=new Rain(random(600), random(600), random(1500));
    rain.add(r);
  }
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\Perseus - Unknown Brain (feat. Chris Clinton)  (1).mp3");
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float r=10;
float a=0;
float al=255;
float camRot=10;
float lim=10;
void draw() {
  background(0);
  //if(amp.analyze()*1000>lim)
  //  background(250);
  translate(0, 400);
  camRot=lerp(camRot,2.1,0.01);
  rotateX(PI/camRot);
  translate(0, -400);
  noFill();
  stroke(255, al);
  for (int i=rain.size()-1; i>0; i--) {
    Rain d=rain.get(i);
    
    
    d.y+=amp.analyze()*200+3;
    
    rain.set(i,d);
    d.display();
    if (d.z<0) {
      if (d.a>1)
        d.ripple();
      else {
         init(i);
      }
    } else {
      d.display();
      stroke(166,166,255);
      d.f=255;
      //if(amp.analyze()*1000>lim){
      //  stroke(0);
      //  d.f=0;
      //}
      line(d.x, d.y, d.z, d.x, d.y, d.z+50);
    }
  }
  init(0);
}
void init(int i){
         Rain r=new Rain(random(600), random(-100,600), random(1500, 500));
        rain.add(r);
        rain.remove(i);
}
