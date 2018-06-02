int n=1000;
float cons=0.4;
PVector[] pos=new PVector[n];
PVector[] vel=new PVector[n];
PVector[] acc=new PVector[n];
float x=-5;
void setup(){
  size(600,600,P3D);
  background(250);
 
  for(int i=0;i<n;i++){
    pos[i]=new PVector(random(600),random(600),random(-3000,300));
    vel[i]=PVector.sub(pos[i],new PVector(300,300,-2100));
    //vel[i]=PVector.sub(new PVector(300,300,-900),pos[i]);
    vel[i].normalize();
    vel[i].mult(1.5);
    acc[i]=PVector.mult(vel[i],cons);
  }
}
void keyPressed(){
    if (key == CODED) {
    if (keyCode == UP) {
      cons=0.5;
      println("sad");
    }
    if(keyCode==DOWN){
      cons=0.0001;
    }
  }
  
}
void draw(){
  
  //lights();
  
  pointLight(53, 112, 239,300,300, -300);
  directionalLight(53, 112, 239,0,0,-1);
  background(1);
  noStroke();
 // float x=map(mouseX,0,600,-05,PI);
  translate(300,300);
  //rotateY(x);
  translate(-300,-300);
  fill(255);
  x+=0.001;
  for(int i=0;i<n;i++){
    pushMatrix();
    translate(pos[i].x,pos[i].y,pos[i].z);
    pos[i].add(vel[i]);
    vel[i].add(acc[i]);
    if(pos[i].z>500){
    pos[i]=new PVector(random(600),random(600),random(-500,00));
    vel[i]=PVector.sub(pos[i],new PVector(300,300,-2100));
    vel[i].normalize();
    acc[i]=PVector.mult(vel[i],cons);
    }
    box(1,1,100);
   //ellipse(0,0,2,2);
    popMatrix();
  }
}