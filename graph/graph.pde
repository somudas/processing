import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;

void setup(){
  size(600,600);
  background(0);
  frameRate(1200);
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\Unknown Brain - Perfect 10 (ft. Heather Sommer).mp3");
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float da=0;
void draw(){
  if(frameCount%600==0)
    background(0);
  stroke(255);
  strokeWeight(amp.analyze()*100);
  point(frameCount%600,(cos(frameCount/1)*100)+300);
}
