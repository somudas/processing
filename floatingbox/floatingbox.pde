int n=100;
int ny=5;
PVector [][] pos=new PVector[n][ny];


void setup(){
  size(600,600,P3D);
  background(0);
  for(int x=0;x<n;x++){
    for(int y=0;y<ny;y++){
      pos[x][y]=new PVector(random())
      
    }
  }
}
float x=300,y=100;
float dx=10,dy=100,dz=1000;
void draw(){
  background(0);
  pointLight(255,150,50,300,300,0);
  noStroke();
  fill(255);
  float ax=map(noise(x+dx),0,1,-PI/2,PI/2);
  float ay=map(noise(dy),0,1,-PI/2,PI/2);
  float az=map(noise(0+dz),0,1,-PI/2,PI/2);
  
  translate(x,y);
  rotateX(ax);
  rotateY(ay);
  rotateZ(az);
  
  box(100,10,100);
  
  y=lerp(y,500,0.1);
  dx+=0.001;
  dy+=0.001;
  dz+=0.001;
  
}
