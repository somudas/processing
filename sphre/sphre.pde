void setup(){
  size(600,600,P3D);
  background(255);
}
float da=0;
float rot=0;
void draw(){
  da+=0.01;
  rot+=0.01;
  background(0);
  directionalLight(255,255,255,0,1,-1);
  pushMatrix();
  noFill();
  stroke(0,200,100,100);
  //fill(200);
  translate(300,300);
  rotateY(-rot);
  rotateX(-da);
  
  sphereDetail(4);
  sphere(noise(rot)*100);
  popMatrix();
  
  
  noFill();
  //fill(100,50);
  noStroke();
  translate(300,300);
  rotate(da);
  translate(-300,-300);
  
  color c=color(255,50);
  noFill();
  
  float xo=0;
  for(float x=-200;x<800;x+=20){
    
    float zo=da*3;
    for(float z=500;z>-700;z-=20){
      
      stroke(c);
      if(x%40==0)
        noStroke();
      
      float an=map(x,00,700,0,PI);
      float zl=map(sin(an),0,1,400,600);
      float h=map(noise(xo,zo),0,1,0,100);
      pushMatrix();
      
      translate(x,zl,z);
      rotate(noise(xo,zo)*da);
      box(20,h+noise(an+da*2)*60,20);
      popMatrix();
      //upper
      
      zl=map(sin(an),0,1,-200,100);
      pushMatrix();
      translate(x,zl,z);
      rotate(-noise(-xo,zo)*da);
      box(30,h+noise(an+da*2)*60,50);
      popMatrix();
      
      zo+=0.1;
    }
    xo+=0.1;
  }

}
