void setup() {
  size(600, 600, P3D);
  background(0);
  frameRate(100);
}
float a=0;
float dx=0;
void draw() {
  background(0);
  //rotateX(PI/4.5);
  noStroke();
  float s=2.5;
  // a=0;
  float xoffset=dx;
  for (float x=0; x<600; x+=s) {
    float yoffset=dx;
    for (float y=0; y<600; y+=s) {
     
      float offset=dist(noise(cos(y/frameCount+100)+1)*x, noise(tan(y/frameCount+100)+1)*x, 300, 300);
      float col=noise(offset,offset+yoffset);
      if(col>0.5)
        fill(0);
        
      else
        fill(255);
      

      rect(x, y, s, s);
   
      
      yoffset+=0.1;
    }
    xoffset+=0.1;
  }
  dx+=0.1;
  println(a);
}
