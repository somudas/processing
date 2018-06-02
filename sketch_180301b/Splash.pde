class Splash{
  PVector center;
  color rgb;
  int fc=0;
  float nValue;
  boolean w=false;
  float rad;
  Splash(PVector c,color r,float ra){
  center=c.get();
  rgb=r;
  rad=ra;
  nValue=random(100);
  }
  void update(){
    if (fc<100){
     // float z=(150-frameCount)/10*0.025;
    translate(random(-1,1),random(-1,1));
    
    }else{
    rad+=0.1;
  }
  }
  void display(){
    float alpha=map(frameCount,0,700,150,0);
    fill(rgb,alpha);
    noStroke();
    beginShape();
    float np=nValue;
    for(float i=0;i<TWO_PI;i+=0.1){
      
      float nois=map(noise(np),0,1,-10,10);
      float x,y;
      if(fc<100){
       x=center.x+rad*cos(i);
       y=center.y+rad*sin(i);
      }else{
       x=center.x+rad*cos(i)+nois;
       y=center.y+rad*sin(i)+nois;
       np+=0.1;
       
      }
      vertex(x,y);
      
    }
    endShape();
    fc++;  
  }
  
}