int n=600/2;
PVector[] p=new PVector[n];
float np=100;
float nnp=0.1;
void setup(){
  size(600,600);
  
  
  for(int i=0;i<n;i++){
    float y=map(noise(np),0,1,400,500);  
    p[i]=new PVector(i*2,y);
    np+=0.01;
  }
}

void draw(){  
  np=100;
  background(0);
  stroke(255);
  line(p[0].x,p[0].y,0,450);
  for(int i=1;i<n-1;i++){
    line(p[i].x,p[i].y,p[i].x,600);
  }
  np+=nnp;
  for(int i=0;i<n;i++){
    float y=map(noise(np),0,1,400,500);  
    p[i]=new PVector(i*2,y);
    np+=0.01;
  }
  nnp+=0.02;

}