int n=125;
PVector[] drops=new PVector[n];
PVector[] vel=new PVector[n];
PVector[] acc=new PVector[n];

void setup(){
  size(600,600,P3D);
  background(0);
  for(int i=0;i<n;i++){
    drops[i]=new PVector(300,300,0);
    vel[i]=new PVector(random(-1,1),random(-1,1),random(1));
    acc[i]=new PVector(random(-1,1),random(-1,1),random(0.01));
  }
}
float da=0;
void draw(){
  background(0);
  //rotate(da);

  for(int i=0;i<n;i++){
    stroke(255);
    if(i%2==0)
      stroke(255);
    strokeWeight(6);
    PVector a=drops[i];
    float d=map(log(da+1),-1,1,-5,5);
    d=0;
   
    point(a.x,a.y-d,a.z);
    for(int j=0;j<n;j++){
      PVector b=drops[j];
      float dis=dist(a.x,a.y-d,a.z+d,b.x,b.y-d,b.z+d);
      strokeWeight(0.5);
      if(dis<100)
      line(a.x,a.y-d,a.z+d,b.x,b.y-d,b.z+d);
    
    }
    drops[i].add(vel[i]);
    vel[i].add(acc[i]);
    if(a.z>200){
      drops[i]=new PVector(300,300,0);
      vel[i]=new PVector(random(-1,1),random(-1,1),random(1));
      acc[i]=new PVector(random(-0.1,0.1),random(-0.1,0.1),random(0.1));
    }
  da+=0.01;
  }
  
}
