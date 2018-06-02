import processing.sound.*;
SoundFile file;
Amplitude amp;
AudioIn in;

void setup(){
   size(600,600);
   background(0);
   //noLoop();
   frameRate(10);
   e=10;
   
   file = new SoundFile(this, "C:\\Users\\Soumyadeep Das\\Downloads\\edms\\T-Mass - Ignoring My Heart.mp3");
   file.play();
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

  float r=50;
  float n;
  float e;
  
  
void draw(){
  float ap=amp.analyze()*2000;
  float gl=map(ap,0,80,1,20);
  glitch((int)gl);
  translate(width/2,height/2);
  
  noFill();
  n=random(100);
  
  float r1,r2,r3;
  
  
 
  e=map(ap,3,80,50,200);
    
    float alpha=map(e,10,200,255,100);
    stroke(random(213),random(200), random(259),alpha);
    
    //rotate(random(TWO_PI));
    float circlelimit=random(PI,2*TWO_PI);
    float circleInitial=random(0,circlelimit);
    float rnd=random(10);
    
      for(float a=circleInitial;a<circlelimit;a+=0.001){
        
        float inc=135;
        r=map(noise(n),0,1,e-inc,e+inc);
        
        if(rnd>5){
        float x=cos(a)*r;
        float y=sin(a)*random(r);
        ellipse(x,y,0.51,0.51);
        }
        else{
        float x=cos(a)*r;
        float y=sin(a)*r;
          ellipse(x,y,0.4,0.51);
        }
        
         
        n+=0.1;
        
        
        
      }

  



}

void glitch(int n){
  if(frameCount%n==0)
    background(0);


}
