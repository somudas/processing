float a=10,b=100,c=200;

void setup(){
  size(600,600,P3D);
  background(0,0,20);
  noLoop();
  frameRate(10);
}

void draw(){
  //background(10);
  stroke(255);
  noFill();
  for(float y=100;y<500;y+=5){
    for(float x=100;x<500;x+=5){
      float r=map(noise(a),0,1,0,255);
      float g=map(noise(b),0,1,0,255);
      float bl=map(noise(c),0,1,0,255);
      if(random(10)>5){
      fill(66,g,bl);
      
      }
      else{
      stroke(66,g,bl);
      noFill();
    }
     a+=0.01;b+=0.01;c+=0.01;
     rect(random(100,x),random(100,y),1,1);
    }
  }
  
}