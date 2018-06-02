import peasy.*;
PeasyCam cam;
void setup(){
  size(600,600,P3D);
  background(0);
  //cam=new PeasyCam(this,700);
  //noLoop();
  //pointLight(255,100,50,300,300,dz);
}
float dz=450;
float ddz=8;
void draw(){
   background(0);
  //translate(-300,-300);
  //for(int x=100;x<500;x+=10){
  //  for(int y=100;y<500;y+=10){
  //    //noStroke();
  //    fill(random(266),random(50),random(255));
  //    pushMatrix();
  //    translate(x,y,-100);
  //    box(10,10,random(50));
  //    popMatrix();
  //  }
  //}
  //noStroke();
  
  pointLight(66,106,254,300,300,dz);
  float da=0;
  dz-=ddz;
  if(dz<-200||dz>500){
    ddz=-ddz;
  }
  boolean q=true;
  for(float z=500;z>-1000;z-=20){
    if(q){
    fill(66,104,244);
    da=2;
    }
    else{
     fill(200,50,100);
     da=0;
    }
    fill(random(266),random(50),random(255));
    fill(255);
  for(float a=0+da;a<TWO_PI+da;a+=0.3){
    //fill(random(266),random(50),random(255));
    float r=map(z,500,-1000,60,1);
    float x=300+r*cos(a);
    float y=300+r*sin(a);
     pushMatrix();
     translate(x,y,z);
     box(7);
     popMatrix();
    
  }
  q=!q;
  //da+=0.1;
  }
}