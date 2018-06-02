void setup(){
  size(600,600,P3D);
  background(0);
  
}
float np=0;
float dnp=0;
void draw(){
  background(0);
  stroke(66,134,255);
  noFill();
  strokeWeight(1);
  translate(300,300);
  np=dnp;
  for(float z=500;z>-1000;z-=10){
    pushMatrix();
    translate(0,0,z);
    float s=map(noise(np),0,1,150,50);
    float w=map(noise(np+100),0,1,150,50);
    ellipse(0,0,s,150);
    popMatrix();
    np+=0.1;
  }
  dnp+=0.1;

}
