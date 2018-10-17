int n=1000;
PVector [] pos=new PVector[n];
PVector [] vel=new PVector[n];
PVector [] siz=new PVector[n];
float s=15;
void setup() {
  size(600, 600, P3D);
  background(250);
  for (int i=0; i<n; i++) {

    pos[i]=new PVector(300, 300, 0);
    vel[i]=new PVector(random(-s, s), random(-s, s), -1);
  }
}
float da=0;
void draw() {
  //background(0);
  translate(300, 300,da*10);
  rotate(da);
  translate(-300, -300);
  da+=0.01;
  directionalLight(255, 255, 255, -1, 1, 0);
  //noFill();
  //stroke(20,55,255);
  noStroke();
  for (int i=0; i<n; i++) {
    PVector a=pos[i];
    fill(266,155,55);
    pushMatrix();
    translate(a.x, a.y, a.z);
    box(20);
    popMatrix();
    pos[i].add(vel[i]);
    
    
    vel[i]=new PVector(random(-s, s), random(-s, s), vel[i].z);
  }
}
