PGraphics canvas;
void setup(){
  size(600,600,P3D);
  background(0);
  canvas=createGraphics(600,600,P3D);
  canvas.beginDraw();
  
  canvas.endDraw();
  
}
float da=0;
float l=10;
float des,a=0;
void draw(){
  //background(0);
  noStroke();
  //stroke(255);
   
  float f=map(sin(da),-1,1,0,255);
  
  
  fill(f);
  
  pointLight(55,255,255,300,300,0);
  translate(300,300);
  rotate(da+a);
  rotateY(-a);
  fill(255);
  da=sin(a);
  beginShape(TRIANGLE_FAN);
  for(int i=0;i<500;i++){
    da=sin(a);
    l=lerp(l,des,0.01);
    des=map(noise(a),0,1,0,200);
    float x=sin(a)*noise(a+i/10)*l;   
    float y=cos(a)*noise(a+log(a+2+i)/10)*l;  
    float z=cos(a)*noise(a+tan(a+i+1)/10)*l;
    
    rotateX(a*10);
    
    vertex(x,y,-z*7);
    //pushMatrix();
    //translate(x,y,z);
    //box(5);
    //popMatrix();
    a+=0.001;
  }
  endShape(CLOSE);
  
  //box(l,l,l);
  da+=sin(a);
  //a+=0.01;
  float x1,x2,x3,x4,x5,x6,x7,x8;
  float y1,y2,y3,y4,y5,y6,y7,y8;
  float z1,z2,z3,z4,z5,z6,z7,z8;
  x1=l/2; y1=-5; z1=l/2;
  
 
  
  canvas.beginDraw();
  canvas.translate(300,400);
  canvas.stroke(255);
  
  canvas.point(x1,y1,z1);
  
  canvas.endDraw();
  
  
}
