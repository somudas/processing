import processing.sound.*;
import peasy.*;
PeasyCam cam;
Amplitude amp;
AudioIn in;
SoundFile file;

void setup() {
  size(600, 600, P3D);
  background(0);
  cam=new PeasyCam(this,500);
  
  String ncs="Alexander Clark - Cadmium - Be With You (feat. Grant Dawson).mp3";
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\"+ncs);
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float da=0;
void draw() {
  background(255);
  noFill();
  pointLight(255,255,255,300,300,1);
  float dda=da;
  stroke(66,166,255);
  rectMode(3);
  translate(0,-100);
  float an=map(noise(da),0,1,-TWO_PI,TWO_PI);
  pushMatrix();
  rotateX(an);
  rotateY(an);
  rotateZ(an+da);
  
  
  //translate(300,300);
  for (float a=0; a<TWO_PI; a+=0.01) {
    pushMatrix();
    rotateX(a);
    rotateY(dda+a);
    rotateZ(a);
    stroke(map(a,0,2*3.14,00,255));
    float l=map(noise(dda),0,1,0,200);
    float b=map(noise(dda+1000),0,1,0,200);
    box(l,b,20);
    //ellipse(0, 0, l, b);
    popMatrix();
    dda+=amp.analyze()/100;
  }
  popMatrix();
  
  pushMatrix();
  translate(00,200,0);
  rotateX(an);
  rotateY(an);
  rotateZ(an+da);
  //translate(0,100);
  for (float a=0; a<TWO_PI; a+=0.01) {
    pushMatrix();
    rotateX(a);
    rotateY(da+a);
    rotateZ(a);
    stroke(map(a,0,2*3.14,00,255),10);
    float l=map(noise(da),0,1,0,200);
    float b=map(noise(da+1000),0,1,0,200);
    box(l,b,20);
    //ellipse(0, 0, l, b);
    popMatrix();
    da+=amp.analyze()/100;
  }
  popMatrix();
  
  fill(0);
  translate(0,250);
  
  box(600,300,1);
  //rect(00,250,600,300);
  
}
