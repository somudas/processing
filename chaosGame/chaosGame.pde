PVector [] pts=new PVector[3];
float x=300,y=300;
void setup(){
  size(600,600);
  background(0);
  frameRate(500);
  pts[0]=new PVector(300,0);
  pts[1]=new PVector(0,600);
  pts[2]=new PVector(600,600);
  
  
}
void draw(){
  stroke(255);
  strokeWeight(1);
  int r=(int)random(3);
  point(x,y);
  x=(x+pts[r].x)/2;
  y=(y+pts[r].y)/2;
  
  
  

}
