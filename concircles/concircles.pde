import peasy.*;
PeasyCam cam;

void setup(){
  size(1366,768,P3D);
  background(0,0,20);
 // cam=new PeasyCam(this,300);
 frameRate(100);
}
float r=10;
float distort=5;
void draw(){
  //background(0);
  translate(0,0,-r+200);
  noFill();
  stroke(random(255),random(255),255,255-r);
  boolean s=random(10)>5?true:false;
  
  
  if(r<250){
    r+=01;
    conc(s);
  }else{
    distort+=1;
    //background(0,0,20);
    conc(s);
    //r=10;
  }
}
void conc(boolean q){
    float max=random(PI*2);
    for(float a=random(PI*2);a<max+PI/2;a+=0.01){
    float r1=map(noise(a*r),0,1,r-distort,r+distort);
    float x=width/2+cos(a)*r1;
    float y=height/2+sin(a)*r;
    ellipse(x,y,2,1);
  }
}
