int n=50;
ArrayList <PVector> pos=new ArrayList<PVector>();
ArrayList <PVector> points=new ArrayList<PVector>();

void setup(){
  size(600,600);
  background(0);
  
}
float nX=random(10000);
float nY=random(10000);
float dis=0;
void draw(){
  background(0,0,20);
  
  
  float aX=map(noise(nX),0,1,0,600);
  float aY=map(noise(nY),0,1,0,600);
  
  nX+=0.01;
  nY+=0.01;
  dis+=0.01;
  
  
   if(pos.size()<n){
      PVector t=new PVector(aX,aY);
      pos.add(t);
    }
    else{
      for(int i=0;i<n-40;i++)
        pos.remove(i);
    }
  
  for(PVector a: pos){
     float x=a.x;
     float y=a.y;
     float q=map(noise(dis),0,1,10,35);
     float x1=random(x-q,x+q);
     float y1=random(y-q,y+q);
     if(points.size()<n)
       points.add(new PVector(x1,y1));
     else{
       for(int i=0;i<n-40;i++){
         points.remove(i);
       }
      }
    }
  
  noStroke();
  beginShape(QUAD_STRIP);
  int g=0;
  for(PVector a: points){
    float alpha=map(g,0,points.size(),100,255);
    float x=a.x;
    float y=a.y;
   fill(random(255),random(55),55,alpha);
   vertex(x,y);
   g++;
  }
  endShape();
  
}
