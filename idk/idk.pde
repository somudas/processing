import peasy.*;
PeasyCam cam;
void setup(){
  size(600,600,P3D);
  background(0);
  //cam=new PeasyCam(this,500);
}
float dx=random(100);
float dy=random(1000);
float dz=random(1000);


void draw(){
  background(0);
  float ax=map(noise(dx),0,1,-TWO_PI,TWO_PI);
  float ay=map(noise(dy),0,1,-TWO_PI,TWO_PI);
  float az=map(noise(dz),0,1,-TWO_PI,TWO_PI);
  translate(300,300,0);
  rotateX(ax);
  rotateY(ay);
  rotateZ(az);
  translate(-300,-300,0);
  float r=random(100);;
  beginShape(SPHERE);
 
    for(float lat=0;lat<TWO_PI;lat+=0.1){
       for(float lon=0;lon<PI;lon+=0.1){
        float x=cos(lon)*sin(lat)*r+300;
        float y=sin(lat)*sin(lon)*r+500;
        float z=sin(lat)*r;
        r+=10;
        float x1=cos(lon)*sin(lat)*r+300;
        float y1=sin(lat)*sin(lon)*r+500;
        float z1=cos(lat)*r;
        r-=10;
        strokeWeight(5);
        stroke(255,50,150);
        
        vertex(x,y,z);
        vertex(x1,y1,z1);
        
        
        line(x,y,z,x1,y1,z1);
    
    }
  }
  endShape();
  
  dx+=0.01;
  dy+=0.01;
  dz+=0.01;
}
