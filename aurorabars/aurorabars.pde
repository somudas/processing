float scl=5;
float x,y;

void setup(){
  size(600,600,P3D);
  x=600/scl;
  
  y=600/scl;
  noLoop();
  
}
void sky(color c){
  pushMatrix();
  float z=-300;
  translate(0,0,z);
  for(float a=z;a<x-z;a++){
    float alpha=map(a,0,x,255,255);
    for(float b=z;b<x-z;b++){
      fill(c,alpha);
      rect(b*scl,a*scl,scl,scl);
    }
  }
  popMatrix();
}
void aurora(){
  float a=0;
  for(int l=500;l>200;l-=25){
    float ap=map(noise(l),0,1,10,50);
   fill(50,255,255-(l-200),100);
  for(int x=100;x<500;x+=1){
    
    //float z=map(noise(x),0,1,-200,100);
  float h=map(noise(a),0,1,50,l);
  //translate(0,0,z);
  rect(x,50+h/2,1,h/2);

  a++;
  }
  
}

}
void draw(){
  background(0,13,54);
  noStroke();
  
  //sky(color(0,13,76));
  aurora();
  rectMode(3);
  fill(255,20);
  rect(300,300,500,500);
  
}