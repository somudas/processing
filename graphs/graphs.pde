


void setup(){
  size(600,600);
  background(20);
  //frameRate(10);
  noLoop();
}

void draw(){
  background(0,100);
  stroke(0);
  fill(66,134,244,100);
  rectMode(3);
  for(int h=50;h<255;h+=30){
    
   for(int y=100;y<500;y+=3){
    fill(random(h),random(y/2),y/2+h/2,100);
     rect(y,300,3,random(h));
   }
  }
  
  
}