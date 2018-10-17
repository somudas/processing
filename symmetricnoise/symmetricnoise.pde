
import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;

void setup() {
  size(600, 600);
 // colorMode(HSB);
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\Diviners - Falling (ft. Harley Bird) [Radio Mix].mp3");
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float dda=0;
float da=0;
float nr=55,ng=255,nb=255;
void draw() {
  background(255);
  float dal=map(noise(dda),0,1,0,0.1);
  float ap=amp.analyze()*100;
  float al=dal+0.1;
  
  //nr=frameCount%255;
  if(amp.analyze()*100>2){
    nr=random(255);
    nb=random(255);
    ng=random(200,255);
  }
  
  float s=6;
  float mov=al*(300/s);
  noStroke();
  {
    float xoffset=0+da;
    for (float x=0; x<300; x+=s) {
      float yoffset=0-da;
      for (float y=0; y<300; y+=s) {
        float n=map(noise(xoffset, yoffset), 0, 1, 0, 255);
        float r=map(noise(xoffset, yoffset),0,1,0,nr);
        float g=map(noise(xoffset, yoffset),0,1,0,ng);
        float b=map(noise(xoffset, yoffset),0,1,0,nb);
        
        fill(r,g,b);
        rect(x, y, s, s);
        yoffset+=al;
      }
      xoffset+=al;
    }
    
  }
  
  {
    float xoffset=da;
    for (float x=0; x<300; x+=s) {
      float yoffset=mov-da;
      for (float y=300; y<600; y+=s) {
        float n=map(noise(xoffset, yoffset), 0, 1, 0, 255);
        float r=map(noise(xoffset, yoffset),0,1,0,nr);
        float g=map(noise(xoffset, yoffset),0,1,0,ng);
        float b=map(noise(xoffset, yoffset),0,1,0,nb);
        
        
        fill(r,g,b);
        rect(x, y, s, s);
        yoffset-=al;
      }
      xoffset+=al;
    }
  }
  
   {
    float xoffset=da+mov;
    for (float x=300; x<600; x+=s) {
      float yoffset=-mov+da;
      for (float y=300; y<600; y+=s) {
        float n=map(noise(xoffset, yoffset), 0, 1, 0, 255);
        float r=map(noise(xoffset, yoffset),0,1,0,nr);
        float g=map(noise(xoffset, yoffset),0,1,0,ng);
        float b=map(noise(xoffset, yoffset),0,1,0,nb);
        
        
        fill(r,g,b);
        rect(x, y, s, s);
        yoffset+=al;
      }
      xoffset-=al;
    }
  }
  
  
   {
    float xoffset=da+mov;
    for (float x=300; x<600; x+=s) {
      float yoffset=da;
      for (float y=00; y<300; y+=s) {
        float n=map(noise(xoffset, yoffset), 0, 1, 0, 255);
        float r=map(noise(xoffset, yoffset),0,1,0,nr);
        float g=map(noise(xoffset, yoffset),0,1,0,ng);
        float b=map(noise(xoffset, yoffset),0,1,0,nb);
        
        
        fill(r,g,b);
        rect(x, y, s, s);
        yoffset-=al;
      }
      xoffset-=al;
    }
  }
  
  dda+=amp.analyze()*2;
  da+=0.1;  
}
