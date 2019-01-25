void setup(){
  size(600,600,P3D);
}
float da=0;
float l=12;
float h;

void draw(){
  background(0);
  directionalLight(55,55,255,1,0,-1);
  noStroke();
  fill(255);
  float xo=da;
  float len=100;
  for(float x=300-len;x<300+len;x+=12){
    h=lerp(h,l,0.01);
    l=random(15);
    noStroke();
    float y=map(sin(xo),-1,1,270,330);
    float z=map(cos(xo),-1,1,-100,100);
    h=map(sin(xo+1),-1,1,0,100);    
    
    pushMatrix();
    translate(x,y,z);
    
    sphere(15);
    popMatrix();
    strokeWeight(0.5);
    stroke(250);
    line(x,-100,z,x,y-100,z);
    
    line(x,100+y,z,x,700,z);
    
    xo+=0.5;
    
  }
  
  

  da+=0.1;
}
