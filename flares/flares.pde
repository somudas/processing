Balls ball[]=new Balls[5]; 
void setup(){
  size(600,600);
  noLoop();
  
  
}
void draw(){
  float r=80;
  float s=92;
  translate(300,350);
  rotate(-PI/2);
  background(5);
  float a=0;
  noFill();
  ellipse(0,0,r*2,r*2);
   stroke( 134,66,255,100);
  noFill();
  for(a=PI/2;a>-PI/2;a-=0.01){
   
    float x=0+cos(a)*r;
    float y=0+sin(a)*r;
    line(x,y,x+random(200),y);
    //s+=0.5;
  }
  for(a=PI/2;a<3*PI/2;a+=0.01){
    float x=0+cos(a)*r;
    float y=0+sin(a)*r;
    line(x,y,x+random(200),y);
    //s+=0.5;
  }
}