PVector [] colors = new PVector[5];

void setup() {
  size(600, 600, P3D);
  background(0);



  colors[0] = new PVector(20,106,204);
  colors[1] = new PVector(56.101,153);
  colors[2] = new PVector(0,255,255);
  colors[3] = new PVector(255,107,64);
  colors[4] = new PVector(204,36,20);
  
  colors[0] = new PVector(11,199,177);
  colors[1] = new PVector(241,240,226);
  colors[2] = new PVector(217,187,116);
  colors[3] = new PVector(242,86,82);
  colors[4] = new PVector(5,69,73);
}
float da=0;
void draw() {
  background(255);
  
  
  strokeWeight(4);
  
  translate(300, 300, 00);
  for (int i=0; i<10; i++) {
    PVector c=colors[i%5];
    
    float r=map(i,0,10,250,10);
    
    
    for(float a=0;a<TWO_PI;a+=0.01){
      
      stroke(c.x,c.y,c.z);
      
      float x=cos(a)*r;
      float y=sin(a)*r;
      float d=noise(da/10)*100;
      float rP=map(noise(x/d+da,y/d+da),0,1,r-d,r+d);
      x=cos(a)*rP;
      y=sin(a)*rP;
      
      line(0,0,x,y);
      
      stroke(50);
      rP-=noise(x/d+da,y/d+da)*50;
      x=cos(a)*rP;
      y=sin(a)*rP;
      //line(0,0,x,y);
      
      
    }
    
   
    da+=0.001;
  }
}
