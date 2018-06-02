import peasy.*;
PeasyCam cam;
int n=20;
float angle=0;
float maxD;
void setup(){
  size(600,600,P3D);
  background(0);
  cam=new PeasyCam(this,500);
  
  //frameRate(10);
}
float r,g,b;
float nr=0,ng=50,nb=255;
void draw(){
  //background(14/6,10/6,100/4);
  //background(0);
  //noStroke();
  //lights();
  r=map(noise(nr),0,1,0,85);
  g=map(noise(ng),0,1,0,205);
  b=map(noise(nb),0,1,0,255);
  nr+=0.0002;
  ng+=0.0062;
  nb+=0.0047;
  background(r/5,g/5,b/5);
  directionalLight(r,g,b, -0.5, 0, -1);
  emissive(51);
  translate(-300,-300);
  maxD=dist(300,300,150,150);
  float w=300/n;
  float offset=0;
    for(int y=150;y<=450;y+=w){
      for(int x=150;x<=450;x+=w){ 
        
        float cD=dist(x,y,300,300);
        offset=map(cD,0,maxD,-PI,PI);
        float a=angle-offset;
        float h=map(sin(a),-1,1,50,200);
         pushMatrix();
         translate(x,y);
         box(w,w,h);
         popMatrix();
         offset-=0.01;
         
      } 
    }    
    angle+=0.1;
}  