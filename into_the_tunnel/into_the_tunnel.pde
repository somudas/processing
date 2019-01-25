void setup(){
  size(600,600,P3D);
  background(0);
  
  
}
float da=0;
void draw(){  
  background(0);
  float siz=10;
  noStroke();
  directionalLight(255,255,255,00,00,-1);
  //directionalLight(255,255,255,00,00,1);
  
  //translate(0,0,300);
  
  //translate(-300,-300);
  
  
  fill(255);
  translate(300,300,da*100);
  
  for(float z=500-da;z>-500-da*100;z-=10){
    
    
    
    for(float a=0;a<TWO_PI;a+=0.1){
      float r=map(noise(z+da+a),0,1,30,150);
      float x=cos(a)*noise(da)*r;
      float y=sin(a)*noise(da)*r;
      float rc=map(noise(x/100-da,y/100,z/100+da),0,1,0,255);
      float gc=map(noise(x/100+da,y/100,z/100-da),0,1,0,255);
      float bc=map(noise(x/100+da,y/100+da,z/100-da),0,1,0,255);
      
     
      siz=map(noise(da),0,1,5,20);
     
      fill(rc,rc/1.5,rc,rc);
      //noFill();
      pushMatrix();
      translate(x,y,z);
      rotateY(da+a);
      rotateX(-da+a);
      rotate(-da+a);
            
      box(siz,siz/1,siz/10);
      popMatrix();
    }
    
  da+=0.0001;
  }  
  
}
