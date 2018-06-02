import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;

void setup(){
  size(600,600);
  background(0);
  
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  file = new SoundFile(this, "C:\\Users\\Soumyadeep Das\\Downloads\\edms\\T-Mass - Ignoring My Heart.mp3");
  file.play();
}
float r=50;

float s;
void draw(){
  
  
  float ap=amp.analyze()*2500;
  
  //glitchrate
  int gR=(int)(map(ap,0,80,3,10));
  glitch(gR);
  noStroke();
  fill(random(255),random(155),255);
  s=random(100);
  translate(width/2,height/2);
  
  
  for(float a=0;a<TWO_PI;a+=0.01){
    float r=map(noise(s),0,1,ap-10,ap+70);
    for(int i=0;i<1;i++){
    float x=cos(a)*r;
    float y=sin(a)*random(r);
    
    ellipse(x,y,1,1);
    
    s+=0.01;}
  }
}

void glitch(int intensity){
  if(frameCount%intensity==0){
    background(0);
  }

}
