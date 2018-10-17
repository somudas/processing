import peasy.*;
PeasyCam cam;
void setup(){
  size(600,600,P3D);
  background(0);
  //noLoop();
  //cam=new PeasyCam(this,500);
}
float forward=200;
float df=10;
float n=2;
float dn=0.05;
void draw(){
  background(0);
  noStroke();
  directionalLight(266,234,255,0,1,-1);
  if(forward>500 || forward <100){
    df=-df;
  }
  forward+=df;
  
 
  //if(keyPressed){
  //  moves();
  //}
  if(n<1.5 || n>4){
    dn=-dn;
  }
  n+=dn;
  println(n);
  rotateX(PI/n);
  
  
  
  float zX=map(mouseX,0,600,-PI/3,PI/3);
  translate(300,forward,-240);
   //rotateZ(zX);
  recursiveBox(0,0,40,20);
  for(int i=1;i<100;i++){
    translate(0,(-forward),0);
    recursiveBox(0,0,40,i);
  }
}

void recursiveBox(float x,float y,float s,float np){
  pushMatrix();
  translate(x,y);
  fill(66,y+100,250);
  //float l=map(noise(np),0,1,200,1);
  box(s,s,x);
  np++;
  popMatrix();
  if(s>25){
    recursiveBox(x+s*2,y,s*0.8,(x+s+y)/3);
    recursiveBox(x,y-s*2,s*0.8,(x+s+y)/3);
    recursiveBox(x-s*2,y,s*0.8,(x+s+y)/3);
    recursiveBox(x,y+s*2,s*0.8,(x+s+y)/3);
    
  }

}
void moves() {
  if (keyCode == UP) {
     forward+= 2;
  }
  if(keyCode == DOWN){
    forward-= 2;
  }
}
