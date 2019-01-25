import processing.sound.*;
import peasy.*;
PeasyCam cam;
Amplitude amp;
AudioIn in;
SoundFile file;

int n=100;
PVector[] pos=new PVector[n];
PVector[] vel=new PVector[n];
PVector[] des=new PVector[n];


void setup(){
  size(600,600,P3D);
  background(245);
  for(int i=0;i<n;i++){
    float s=2;
    pos[i]=new PVector(300,300,random(-600));
    
    vel[i]=new PVector(random(-s,s),random(-s,s),random(s));
    
  }
  //String ncs="Itro - Panda _NCS Release_.mp3";
  //file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\"+ncs);
  //file.play();
  //amp = new Amplitude(this);
  //in = new AudioIn(this, 0);
  //in.start();
  //amp.input(in);
}
float da=0;
float m=1;
void draw(){
  background(255);
  m=lerp(m,0,0.00001);
  noStroke();
  pointLight(55,125,255,300,300,200);
  translate(300,300);
  rotate(da/10);
  rotateX(-da/10);
  
  float r=100;

  for(float a=0;a<=TWO_PI;a+=0.01){
    pushMatrix();
    rotate(a);
    
    rotateX(-da+a);
    rotateY(da-a);
    
    float f=map(sin(a+da),-1,1,00,255);
    fill(f,55,255);
    
    r=map(cos(a+da),-1,1,20,100);
    float x=cos(a)*cos(-da)*r;
    float y=sin(da+a)*cos(a)*r;
    float z=sin(a)*r;
    
    translate(x,y,z);
    rotateY(-da-a);
    rotateX(da-a);
    
    box(10,50,100);
    popMatrix();
    
  
  }
   translate(-300,-300);
  for(int i=0;i<n;i++){
   PVector a=pos[i];
   strokeWeight(1);
   stroke(247,251,51);
   for(int j=0;j<n;j++){
     PVector b=pos[j];
     float ds=dist(a.x,a.y,a.z,b.x,b.y,b.z);
     if(ds<200)
       line(a.x,a.y,a.z,b.x,b.y,b.z);
   }
   noStroke();
   pushMatrix();
   translate(a.x,a.y,a.z);
   box(10);
   popMatrix();
   pos[i].add(vel[i]);
   vel[i].mult(m);
   if(a.z>400){
       float s=2;
      pos[i]=new PVector(300,300,random(-600));
      vel[i]=new PVector(random(-s,s),random(-s,s),random(s));
   }
  }
  da+=0.05;
}
