import processing.sound.*;
import peasy.*;
PeasyCam cam;
Amplitude amp;
AudioIn in;
SoundFile file;
PFont font;
int n=105;
PVector[] pos=new PVector[n];

float x, da=0;
void setup() {
  size(600, 600);
  background(0);
  x=random(TWO_PI);

  for (int i=0; i<n; i++) {
    pos[i]=new PVector(random(300, 600), random(0, 300), random(TWO_PI));
  }


  font=createFont("IMPACT", 70);
  String[] fontList = PFont.list();
  printArray(fontList);
  String ncs="Deflo & Lliam Taylor - Reflections.mp3";
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\"+ncs);
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float ty=0;
void draw() {
  background(0, 0, 20);

  for (int i=0; i<n; i++) {
    rectMode(3);
    strokeWeight(0.5);
    pushMatrix();
    PVector a=pos[i];
    translate(a.x, a.y);
    rotate(a.z);
    noFill();
    stroke(200);
    //rect(0, 0, 100, 200);
    popMatrix();
    strokeWeight(1);
    for (int j=0; j<n; j++) {
      PVector b=pos[j];
      if (dist(a.x, a.y, b.x, b.y)<50) {
        line(a.x, a.y, b.x, b.y);
      }
    }
  }

  textFont(font);
  textAlign(CENTER);
  textSize(52);
  noStroke();
  fill(255);
  text("F              CUS", 300, ty);
  textSize(20);


  ty=lerp(ty, 320, 0.05);
  translate(270, 300);
  float rad=map(noise(da), 0, 1, 0, 50);
  x=map(noise(da/10), 0, 1, 0, TWO_PI);
  for (float r=0; r<TWO_PI; r+=0.1) {
    rotate(r);
    for (float a=x; a<x+PI; a+=0.1) {
      float y=sin(a)*50;
      float px=map(a, x, x+PI, 0, rad);
      float sw=map(a, x, x+PI, 0, 10);
      float f=map(a, x, x+PI, 0, 255);
      stroke(f*0.7, f, f*1.5, 200);
      strokeWeight(sw);
      point(px, y);
    }
  }
  
  

  da+=amp.analyze()*10;
}
