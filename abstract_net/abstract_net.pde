int n=100;
PVector [] pos=new PVector[n];
PVector [] vel=new PVector[n];


void setup(){
  size(600,600,P3D);
  background(0);
  for(int i=0;i<n;i++){
    float s=1;
    pos[i]=new PVector(random(600),random(600),random(-500,00));
    vel[i]=new PVector(random(-s,s),random(-s,s),random(-s,s));
  
  }
}
float da=0;
void draw(){
  //background(0);
  //stroke(255);
  strokeWeight(1);
  
  noFill();
  
  translate(300,300,da);
  //rotate(da);
  //rotateX(da);
  
  translate(-300,-300);
  da+=0.01;
  for(int i=0;i<n;i++){
    PVector a=pos[i];
   
    for(int j=0;j<n;j++){
      float f=map(a.z,-500,00,00,255);
      
      stroke(f*0.2,f*0.9,f*1.2);
    
      
      point(a.x,a.y,a.z);
       
      PVector b=pos[j];
      float d=dist(a.x,a.y,a.z,b.x,b.y,b.z);
      if(d<100){
         line(a.x,a.y,a.z,b.x,b.y,b.z);
      }
    }
    pos[i].add(vel[i]);
    //pos[i].z+=1;
    
   //reflect(i,a);
      
    
  
  
  }
  
}

void reflect(int i,PVector a){
  
    if(a.x<0 || a.x>600)
      vel[i].x*=-1;
    if(a.y<0 || a.y>600)
      vel[i].y*=-1;
    if(a.z<-500 || a.z>00)
      vel[i].z*=-1;
      

}
