import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;


int n=1500;
PVector[] pos=new PVector[n];
PVector [] vel=new PVector[n];
void setup(){
  size(600,600,P3D);
  background(255);
  for(int i=0;i<n;i++){
    pos[i]=new PVector(random(100,500),random(100,500),random(-200,200));
    vel[i]=new PVector(0,0,random(-1,2));
  }
  
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\Lost Sky - Dreams.mp3");
  file.play();
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float an=0;
void draw(){
  float bc=5;
  float f=250;
  float s=3;
  float am=amp.analyze()*1000;
  if(am>10){
    s=5;
  }
  
  println(am);
  background(bc);
  translate(300,300);
  rotate(an);
  translate(-300,-300);
  fill(100);
  stroke(0);
  strokeWeight(5);
  noStroke();
  for(int i=0;i<n;i++){
    PVector e=pos[i];
    pushMatrix();
    translate(e.x,e.y,e.z);
    
    fill(f);
    ellipse(0,0,s,s);
    fill(f,50);
    ellipse(0,0,7,7);
    popMatrix();
    
    pos[i].add(vel[i]);
    
    if(pos[i].z>500){
        pos[i]=new PVector(random(600),random(600),random(-500,00));
    } 
  }
  
  an+=0.005;
  
  
}
