void setup(){
  size(600,600,P3D);
  background(0);
}
float da=0;
float dda=0.00005;
void draw(){
  background(0,0,20);
  rotateX(PI/4);
  float d=da;
  translate(300,400);
  //stroke(255);
  noStroke();
  fill(frameCount/10,55,255);
  for(float a=0;a<TWO_PI;a+=0.01){
    float r=(1+sin(d))*50;
    float x=cos(a)*r;
    float y=sin(a)*r;
    pushMatrix();
    translate(x,y);
    box(1,10,1);
    popMatrix();
    point(x,y);
    
    d+=da;
    d+=0.000001;
  }
  if(da>0.05780069 || da<0)
    dda=-dda;
  da+=dda;
  if(mousePressed){
    println(da);
  }
}
