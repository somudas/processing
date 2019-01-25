int n=50;
PVector [] pos=new PVector[n];
PVector [] vel=new PVector[n];


void setup(){
  size(600,600,P3D);
  background(0);
  for(int i=0;i<n;i++){
    float s=1;
    pos[i]=new PVector(random(600),random(600),random(600));
    vel[i]=new PVector(random(-s,s),random(-s,s),random(-s,s));
  }
}
float da=0;
void draw(){
  translate(300,300);
  rotate(noise(da/10)*da);
  translate(-300,-300);
  noStroke();
  pointLight(255,255,255,300,300,0);
  

  
  for(int i=0;i<n;i++){
    PVector a=pos[i];
    cir(a.x,a.y,a.z);
    pos[i].add(vel[i]);
    vel[i].x=vel[i].y;
    vel[i].y=vel[i].x;
    vel[i].z=vel[i].y;
    
    
    
  }
  da+=0.01;
}
void cir(float x,float y,float z){
   pushMatrix();
   translate(x,y,z);
   float r=100;
   for(float a=0;a<TWO_PI;a+=0.1){
     float cx=tan(a)*r;
     float cy=sin(da)*cos(a)*r;
     pushMatrix();
     translate(cx,cy);
     box(3);
     popMatrix();
     //point(cx,cy);
     r=noise(a)*r;
   }
   popMatrix();
}
