class Circle{
  float radius;
  color rgb;
  float nValue;
  PVector center;
  
  Circle(float a,PVector c,color q){
  radius=a;
  rgb=q;
  center=c.get();
  nValue=random(1000);
  }
  void update(){
    radius+=0.1;
  }
  void display(){
    fill(rgb,100);
    noStroke();
    beginShape();
    float np=nValue;
    for(float i=0;i<TWO_PI;i+=0.1){
      float nois=map(noise(np),0,1,0,50);
      float x=center.x+radius*cos(i)+nois;
      float y=center.y+radius*sin(i)+nois;
      vertex(x,y);
      np+=0.1;
    }
    endShape();
    
  }
}