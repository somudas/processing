
void setup(){
  size(600,600,P3D);
  //noLoop();
  background(0);
}

void draw(){
  background(0);
  stroke(255);
  float x=map(mouseX,0,600,-600,600);
  float y=map(mouseY,0,600,-600,600);
  
  //translate(x,y);
  
  //translate(0,600);
  //rotateY(PI/4);
  //translate(0,-600);
  for(float i=0;i>-1000;i--){
    
    translate(x,y,i);
    
    box(1,500,1);
   
  }

}