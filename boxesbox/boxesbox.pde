

void setup(){
  size(600,600,P3D);
  background(0);
  noLoop();
  frameRate(10);
}


void draw(){
  background(0,0,20);
  stroke(255);
  noFill();
  //float sx=map(mouseX,0,600,-PI,PI);
  //float sy=map(mouseY,0,600,-PI,PI);
  //translate(300,300);
  //rotateX(PI/sy);
  //rotateY(PI/sx);
  //translate(-300,-300);
  for(float x=100;x<500;x+=20){
    for(float y=100;y<500;y+=20){
      pushMatrix();
      translate(x,y);
      box(10,10,random(50));
      popMatrix();
    }
  }

}