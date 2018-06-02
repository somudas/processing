int n=100;
PVector center;
PVector [] dots=new PVector[n];
void setup(){
  size(600,600,P3D);
  background(0);
  for(int i=0;i<n;i++){
    dots[i]=new PVector(random(600),random(600),random(-1000,0));
  }
  center=new PVector(300,300,-500);
  
  //noLoop();
  //frameRate(20);
}
float yg=0;
void draw(){
  background(0,0,20);
  float y=map(mouseY,0,600,0,3);
  //rotateX(PI/y);
  stroke(random(65),random(134),255);
  strokeWeight(0.2);
  for(int i=0;i<n;i++){
    line(dots[i].x,dots[i].y,dots[i].z,center.x,center.y,center.z);
    pushMatrix();
    translate(dots[i].x,dots[i].y,dots[i].z);
    sphere(3);
    popMatrix();
  }
}