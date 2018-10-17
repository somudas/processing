
import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;
void setup(){
  size(600,600,P3D);
  background(0);
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\Perseus - Unknown Brain (feat. Chris Clinton)  (1).mp3");
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
  float res=50;
  float offset=0;
  float dup=0;
void draw(){
  background(0);
  float up=map(noise(dup),0,1,0,10);

  pointLight(255,255,255,300,300,0);
   translate(0,100,-500);
  rotateX(PI/3);
  noStroke();
  fill(00);
 

  for(int x=0;x<600;x+=10){
    for(int y=0;y<600;y+=10){
      
      float dis=dist(x,y,300,300);
      float a=map(dis,up*40,500+up*10,-up,up);
      float h=map(sin(offset+a),-1,1,0,res);
      float r=map(noise(h),0,1,0,250);
      float g=map(noise(h+1000),0,1,0,100);
      float b=map(noise(h+200),0,1,0,250);
      float f=map(h,0,res,0,200);
      fill(f/2,f/5,f);
      pushMatrix();
      translate(x,y);
      box(10,10,h);
      popMatrix();
      
    }
    offset-=0.001;
  }
  
  dup+=amp.analyze()*10;
}
