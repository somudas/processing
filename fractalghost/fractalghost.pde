float a=0.6;
float da=0;
float sh=0,f;
void setup(){
  size(600,600,P3D);
  background(0);
}
void draw(){  
  //background(0);
  strokeWeight(3);
  
  f=map(sin(da),-1,1,0,255);
  stroke(252);
  translate(300,600);
  
  rotateY((da+sh/10)/10);

  branch(200+sh*2.5);
  sh=map(noise(da),0,1,0,30);
  da+=0.1;
  
}

void branch(float l){
  stroke(266,155,255);
  if(l<30)
    stroke(266,266,55);
  stroke(f/2,f/4,f);
  line(0,0,0,-l);
  translate(0,-l);
      
  if(l>4){
  pushMatrix();
  translate(0,sh);
  rotateY(a);
  rotate(a);
  branch(l*0.6);
  popMatrix();
  pushMatrix();
  
  translate(0,sh);
  rotate(-a);
  rotateX(-a);
  
  branch(l*0.6);
  popMatrix();
  
  }
  
}
