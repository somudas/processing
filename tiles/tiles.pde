float s=600;
float sy=600;
void setup(){
  size(600,600,P3D);
  background(0);
  
  
}
void draw(){
 // background(0);
  s=random(300);
  sy=random(600);
 // background(0);
 //lights();
 // noStroke();
  directionalLight(51, 102, 126, -1, 0, 0);
  translate(s,sy, random(-600,600));
  box(50);
}