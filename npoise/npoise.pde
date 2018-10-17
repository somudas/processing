void setup(){
  size(600,600);
  for(int i=0;i<600;i++){
    a[i]=random(10);
  }
  frameRate(1000);
}
float[] a=new float[600];
float cx=0;
float dcx=1;
void draw(){
  background(0);
  
  
  for(int x=0;x<600;x++){
    float y=map(noise(a[x]),0,1,0,600);
    if(x==cx)
      a[x]+=0.1;
    stroke(255);
    strokeWeight(y/50);
    point(x,y);
  
  }
  cx+=dcx;
  if(cx>600 || cx<0)
    dcx=-dcx;
  
}
