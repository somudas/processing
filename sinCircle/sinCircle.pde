void setup() {
  size(600, 600, P3D);
  background(0);
}
float da=0;
float xa=random(100),ya=random(100),za=random(1000);
void draw() {
  background(0);
  noStroke();
  
  
  float xRot=map(noise(xa),0,1,-1,1);
  float yRot=map(noise(ya),0,1,-1,1);
  float zRot=map(noise(za),0,1,-1,1);
  
  float s=20;
  float xt=map(noise(xa*10),0,1,-s,s);
  float yt=map(noise(ya*10),0,1,-s,s);
  float zt=map(noise(za*10),0,1,-s,s);
  
  //pointLight(255,255,255,300,300,100);
  directionalLight(255,255,255,0,1,-1);
  translate(300+xt, 300+yt,zt+100);
  rotateX(xRot);
  rotateY(yRot);
  rotateZ(zRot);
  
  float xo=da;
  float r=100;
  for (int i=0; i<10; i++) {
    r=map(noise(xo/10),0,1,25,i*20);
    float rc=map(noise(xo/10),0,1,0,250);
    float gc=map(noise(xo/10+100),0,1,0,150);
    float bc=map(noise(xo/10+500),0,1,0,55);
    
    //fill(108,255,50);
    //if(gc>100)
    //  fill(255);
    
    PVector col=new PVector(rc,gc,bc);
    for (float a=0; a<TWO_PI; a+=0.051) {
      pushMatrix();
      rotate(a);
      r=map(noise(xo),0,1,0,i*20);
      translate(r, r);
      rotateX(xo);
      rotateY(-xo);
      fill(col.x,col.y,col.z,200);
      //fill(255);
      box(r/2);
      popMatrix();
      xo+=0.3;
    }
    xo+=0.1;
  }
  da+=0.01;
  
  
  xa+=0.01;
  ya+=0.01;
  za+=0.01;
  
  
}
