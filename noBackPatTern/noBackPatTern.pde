import peasy.*;
import processing.sound.*;
PeasyCam cam;
Amplitude amp;
AudioIn in;
SoundFile file;

int n=400;
PVector[]pos=new PVector[n];
PVector[]vel=new PVector[n];
Trail [] tr=new Trail[n];
void setup() {
  cam=new PeasyCam(this,500);
  size(600, 600, P3D);
  background(0);
  
  String ncs="Acejax feat. Danilyon - By My Side.mp3";
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\"+ncs);
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  for (int i=0; i<n; i++) {
    init(i);
  }
}
float da=0;

void init(int i) {
  int s=1;
  pos[i]=new PVector(300, 300, 0);
  vel[i]=new PVector(random(-s, s), random(-s, s), random(-s, s));
  tr[i]=new Trail(1);
  
}
void draw() {

  translate(0,0);
  rotateX(-da);
  //rotateZ(noise(da)*-da);
  //rotateY(noise(da)*-da);
  rotate(da);
  translate(-300, -300, 0);
  pointLight(114,25,255,300,300,100);
  da+=amp.analyze()/10+0.01;
  strokeWeight(1);
  noStroke();
  if(frameCount%350==0){
    background(0);
  }
  //background(0);
  for (int i=0; i<n; i++) {
    PVector a=pos[i];

    for (int j=0; j<tr[i].p.size(); j++) {
      
      PVector b=tr[i].p.get(j);

      pushMatrix();
      
      translate(b.x, b.y, b.z);
     
      fill(255);
      box(5);
      popMatrix();
    }

    if (a.z>500 || a.z<-500 || a.x<-100 || a.x>800) {
     init(i);
    }
    pos[i].add(vel[i]);

    tr[i].add(pos[i]);
    
    
  }
}
