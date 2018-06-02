int n=50;
PVector []xy=new PVector[n];

void setup(){
  size(600,600,P3D);
  background(0);
  for(int i=0;i<n;i++){
    xy[i]=new PVector(random(100,500),random(100,500),random(0,-100));
  }
  noLoop();
}


void draw(){
  
  strokeWeight(3);
  stroke(66,134,244,50);
  fill(255);
  for(int i=0;i<n;i++){
  point(xy[i].x,xy[i].y,xy[i].z);
  strokeWeight(0.5);
  for(int j=0;j<n;j++){
    //stroke(random(255),random(255),random(255),50);
  line(xy[i].x,xy[i].y,xy[i].z,xy[j].x,xy[j].y,xy[i].z);
  }
  }
  
}