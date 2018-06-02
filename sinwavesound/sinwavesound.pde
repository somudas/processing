  

import processing.sound.*;
SoundFile file;
Amplitude amp;
AudioIn in;
void setup() {
  size(600, 600);
    
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "C:\\Users\\Soumyadeep Das\\Downloads\\niviro.mp3");
  file.play();
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}      
float da=0;
float r=random(1000),b=random(1000),g=random(1000);
void draw() {
  
  float a=amp.analyze()*2000;
  background(0);
  float an=da;
  fill(random(166),random(134),255);
  float dan=random(PI/2);
  float dx=random(1,10);
  float cr=map(noise(r),0,1,0,255);
  float cg=map(noise(g),0,1,0,255);
  float cb=map(noise(b),0,1,200,255);

  for(float x=100;x<=500;x+=dx){
    
    float y=map(sin(an),-1,1,300-a,300+a);
    float y1=map(cos(an+dan),-1,1,300-a,300+a);
    ellipse(x,y,5,5);
    ellipse(x,y1,5,5);
    an+=0.1;
    
  }
  da+=0.1;
  r+=0.1;b+=0.1;g+=0.1;
  
}
