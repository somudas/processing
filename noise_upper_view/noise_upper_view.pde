void setup(){
  size(600,600,P3D);
  background(0);
}
float da=0;
void draw(){
  background(0);
  directionalLight(255,255,255,0,0,-1);
  noFill();
  
  translate(0,0,00);
  
  stroke(0,250,200,100);
  //noStroke();
  //fill(255,100);
  float siz=10;
  
  float xo=da;
  for(float x=0;x<600;x+=siz){
    float yo=0;
    for(float y=0;y<600;y+=siz){
      siz=map(noise(xo,yo),0,1,5,15);
      float z=map(noise(xo,yo),0,1,0,-500);
      
      pushMatrix();
      translate(x,y,z);
      
      rotateY(noise(xo,yo)*da);
      box(siz);
      popMatrix();
      
      yo+=0.1;
    }
    xo+=0.1;
  }
  da+=0.01;
  
  
}
