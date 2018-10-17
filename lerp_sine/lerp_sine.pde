void setup(){
  size(600,600,P3D);
  background(0);
}
float da=0;
void draw(){  
  background(0);
  stroke(255);
  strokeWeight(2);
  float r=100;
 
  
  for(float a=da;a<da+50;a+=0.01){
    float y=cos(a)*cos(-a)*r+300;
    float x=tan(-a)*cos(a)*r+300;
    r=lerp(r,0,0.001);
    //rect(x,y,1,500);
    point(x,y,r);
    
  }

  da+=0.1;

}
