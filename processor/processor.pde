
void setup(){
  size(600,600);
  background(0);
  //noLoop();
  frameRate(25);
}
float l1=10,l2=100,l3=132,l4=233;
void draw(){
  
  background(0);
  stroke(255);
  for(float x=250;x<=350;x+=10){
    float h=map(noise(l1),0,1,0,250);
    line(x,250,x,h);
    ellipse(x,250,2,2);
    l1+=1;
  }
  for(float x=250;x<=350;x+=10){
    float h=map(noise(l2),0,1,350,600);
    line(x,350,x,h);
    ellipse(x,350,2,2);
    l2+=1;
  }
  for(float y=250;y<=350;y+=10){
    float h=map(noise(l3),0,1,0,250);
    line(250,y,h,y);
    ellipse(250,y,2,2);
    l3+=1;
  }
  for(float y=250;y<=350;y+=10){
    float h=map(noise(l4),0,1,350,600);
    line(350,y,h,y);
    ellipse(350,y,2,2);
    l4+=1;
  }
}
