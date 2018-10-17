void setup(){
  size(600,600,P3D);
  background(0);
}
float dz=0;
void draw(){
  background(0);
  
  noStroke();
  float xoffset=0;
  for(int x=0;x<600;x+=20){
    float yoffset=0;
    for(int y=0;y<600;y+=20){
      float zoffset=dz;
      for(int z=00;z>-300;z-=20){
         pushMatrix();
         translate(x,y,z);
         float alp=map(noise(xoffset,yoffset,zoffset),0,1,0,155);
         
         fill(255,alp);
         
         box(20);
         
        
         popMatrix();
         zoffset+=0.1;
      }
      yoffset+=0.1;
    }
    xoffset+=0.1;
  }
  
  
  dz+=0.1;
}
