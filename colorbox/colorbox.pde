void setup(){
  size(600,600,P3D);
  background(0,0,10);
  noLoop();
}
void draw(){
  //background(0);
  stroke(0);
  //directionalLight(random(166),random(55),random(255),0,0,1);
  lights();
  for(int i=1;i<1150;i++){
    fill(random(166),random(136),random(245));
  pushMatrix();
  translate(random(100,500),random(100,500),random(-600,0));
  rotate(random(PI));
  box(random(20));
  popMatrix();
  }
}