import peasy.*;
import processing.sound.*;
SoundFile file;
Amplitude amp;
AudioIn in;
PeasyCam cam;



void setup(){
  size(600,600,P3D);
  cam=new PeasyCam(this,200);
  
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\Codeko - Crest _NCS Release_.mp3");
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float dx=random(1000);
float dy=random(1000);
float dz=random(1000);
void draw(){
  float a=0.05;
  translate(-300,-300);
  background(0);
  float s=200;
  //noStroke();
  //directionalLight(255,255,255,0,1,-1);
  float xoffset=dx;
  for(float x=s;x<600-s;x+=10){
    float yoffset=0;
    for(float y=s;y<600-s;y+=10){
      float zoffset=dz;
      for(float z=-s;z<00;z+=10){
        pushMatrix();
        
        float am=amp.analyze()*200;
        translate(x,y,z);
        fill(am*50,55,255);
        float h=map(noise(xoffset,zoffset,yoffset),0,1,1,am);
        float hr=map(noise(xoffset,zoffset,yoffset),0,1,1,5);
        box(h);
        popMatrix();
        zoffset+=a;
      }
      yoffset+=0.001;
    }
     xoffset+=a;
  }
  dx+=a;
  dy+=a;
  dz+=a;
  
  
  
}
