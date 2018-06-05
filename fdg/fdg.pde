import processing.sound.*;
SoundFile file;
Amplitude amp;
AudioIn in;

void setup(){
  size(600,600,P3D);
  
  background(0);

  file = new SoundFile(this, "D:\\p3d\\sound\\q.mp3");
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
void gradient(color cl,float ws){
float ex=random(ws/4);

translate(-5,0);
for(float i=0;i<ex;i++){
  translate(2,3);
  float a=map(i,0,ex,255,0);
  fill(cl,a);
  rect(0,0,5,3);
  }
}
void circle(float r){
  float max=map(r,50,350,random(PI),TWO_PI);
  for(float a=random(PI);a<max;a+=0.2){
    pushMatrix();
    rotate(a);
    translate(0,20);
    //rotate(-a);
    gradient(color(66,134,255),r);
    popMatrix();
  }  
}
float np=100;
void draw(){

  float am=amp.analyze()*10000;
  
  background(0);
  noStroke();
  translate(300,300);
    circle(am);

}
