void setup(){
  size(600,600);
  frameRate(20);
}
float da=0;
void draw(){
  background(200,100,20);
  float r=10;
  //noStroke();
  for(float a=0;a<30.8;a+=0.1){
    float x=300+atan(a)*r;
    float y=300+sin(a)*1.5*r;
    float s=(sin(da)+1)*20;
    fill(0);
    ellipse(x+5,y+55,s,s);
    fill(255);
    ellipse(x,y,s,s);
    da+=0.1;
  }
  
}
