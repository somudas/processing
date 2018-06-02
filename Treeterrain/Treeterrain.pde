import peasy.*;
PeasyCam cam;
int n=50;
Tree [] trees=new Tree[n];
PVector [] pos=new PVector[n];
void setup(){
  size(600,600,P3D);
  background(0);
  cam=new PeasyCam(this,500);
  for(int i=0;i<n;i++){
    trees[i]=new Tree(random(1,3));
    pos[i]=new PVector(random(600),random(-500,100));
  }
}
void draw(){
  background(173, 210, 255);
  translate(-300,-300);
  fill(46, 142, 1);
  pushMatrix();
  translate(300,450,-200);
  
  box(600,10,600);
  popMatrix();
  for(int i=0;i<n;i++){
    pushMatrix();
    translate(pos[i].x,400,pos[i].y);
    trees[i].display();
    popMatrix();
  
  }
  
}
