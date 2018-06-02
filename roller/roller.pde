import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;
PVector [] colors;


void setup(){
  size(600,600,P3D);
  background(0);
  //cam=new PeasyCam(this,700);
  int n=0;
  for(float z=400;z>-500;z-=10){
    n++;
  }
  colors=new PVector[n];
  for(int z=0;z<n;z++){
    colors[z]=new PVector(random(205),random(100),100);
  }
  
  
  file = new SoundFile(this, "C:\\Users\\Soumyadeep Das\\Downloads\\edms\\K-391 & Alan Walker - Ignite (feat. Julie Bergan & Seungri) (128  kbps).mp3");
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float ap=0;
float np=50;
void draw(){
  
  float con=map(noise(ap/10),0,1,50,120);
  
  float ampl=amp.analyze()*10;
  background(0,0,20);
  noStroke();
  float transY=map(sin(TWO_PI-(ap-TWO_PI)),-1,1,300-con,300+con);
  float transX=map(noise(ap/10),0,1,200,400);
 
 
  translate(300,transY+120,00);
  
  float as=ap;
  int n=0;
  
  for(float z=400;z>-500;z-=50){
    float alpha=map(z,-500,400,0,255);
    float y=map(sin(as),-1,1,300-con,300+con);
    pushMatrix();
    translate(0,y-350,z-20);
    PVector c=colors[n];
    fill(c.x,c.y,c.z); 
    float angle=map(noise(as/2),0,1,PI/2,-PI/2);
    rotate(angle);
    float l=map(noise(as*4),0,1,50,100);
    box(l,0,40);
    popMatrix();
    as-=0.1;
    n++;
  }
  
  
  
  
  
  //for(float a=0;a<TWO_PI;a+=0.1){
  //  pushMatrix();
  //  fill(random(255),random(100),105);
  //  float r=50;
  //  float y=cos(a)*r;
  //  float z=sin(a)*r;
  //  translate(0,y,z);
  //  box(10,1,10);
  //  popMatrix();
  //  np+=0.01;
  //}
  ap-=ampl/2+0.01;
}
void glitch(int n){
  if(frameCount%n==0)
    background(0);
}
