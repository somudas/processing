import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;

void setup(){
  size(600,600,P3D);
  background(0);
  frameRate(30);
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\Lost Sky - Dreams.mp3");
  file.play();
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
  float da=0;
void draw(){
  

  float r=255,g=255,b=255;
  float aml=amp.analyze()*5000;
  background(0);
  translate(0,100);
  if(aml>60){
    float ran=random(1);
    if(ran>0.66){
      r=random(255);g=0;b=random(255);}
    else if(ran>0.33){
      g=255;r=0;b=0;}
    else{
      b=255;r=0;g=0;}
      
    translate(random(-10,10),random(-10,10),random(-10,10));
  }
  
  
  directionalLight(255,255,255,0,1,-1);
  rotateX(PI/4);
  noStroke();
  float a=da;
  float offset=0;
  for(float x=200;x<400;x+=10){
    for(float y=200;y<400;y+=10){
      float d=dist(x,y,300,300);
      float alpha=map(d,0,100,255,0);
      offset+=0.1;
     
      float h=map(tan(tan(a)),-1,1,0,aml+50);
      d-=h;
      
      fill(r,g,b,alpha);
      pushMatrix();
      translate(x,y);
      box(10,10,d);
      popMatrix();
    }
    a+=offset/100;
  }
  da+=0.1;
}
