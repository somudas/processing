float w,h,scl=3;
PImage img;
float b=0.5,db=0.5,ddb=0.1;
void setup(){
  size(600,600);
  w=600/3;
  h=w;
  img=loadImage("hello.png");
  //noLoop();
  frameRate(5);
}

void draw(){
  background(0);
  image(img,0,0);
 
  for(float y=0;y<600;y+=3){
   for(float x=00;x<600;x+=3){
     color s=get((int)(x),(int)(y));
     fill(s,100);
    
     noStroke();
    // println(s);
     rect(x,y,15,b);
   } 
  }
  b+=db;
  
  if(b>3.5||b<0.5){
    db=-db;
  }
}