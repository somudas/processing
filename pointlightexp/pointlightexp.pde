import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;

void setup(){
  size(600,600,P3D);
  background(0);
  
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\Warriyo - Mortals.mp3");
  file.play();
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float dy=0;

float rc,gc,bc;
void draw(){
  
  float zmov=amp.analyze()*10000;
  println(zmov);
  if(zmov<50){
    
    rc=random(255);
    gc=random(255);
    bc=random(255);
    
    
  }
  if(zmov>120)
    translate(random(zmov/10),random(zmov/10),random(zmov/100));
  
  background(0);
  //directionalLight(55,155,255,-1,1,0);
  pointLight(rc,gc,bc,300,300,zmov);
  pushMatrix();
  translate(300,530,190);
  
  box(600,10,700);
  popMatrix();
  translate(0,550,-400);
  rotateX(PI/1.7);
  translate(0,-400);
  noStroke();
  
  float cy=dy;
  boolean gap=false;
  float gapY=0;
  for(float y=0;y<1600;y+=10){
    
    if(cy%200==0)
      gap=true;
      
    if(!gap){
      
      
      for(float x=0;x<600;x+=10){
        
        if(x>250 && x<350){
          //road
          
        }else{
          //building
          pushMatrix();
          
          float height=map(noise(cy,x),0,1,0,100);
          translate(x,y,-height/2+10);
          ambient(height*1.3,height*1.5,height*2);
          
          box(10,10,height);
          popMatrix();
        }
        
      }
    }
    else{
       //y road;
       gapY+=10;
       if(gapY==50){
         gap=false;
         gapY=0;
       }
    }
    cy+=10;
  }
 dy-=10;
}
