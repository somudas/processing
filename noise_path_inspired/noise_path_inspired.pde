
void setup() {
  size(600, 600, P3D);
  background(0);
}

float da=0;

void draw() {
  background(0);
  
  
 
  
  float wallZ = -200;
  
  //behind screen
  fill(255);
  pushMatrix();
  translate(300, 300, wallZ);
  box(600, 600, 1);
  popMatrix();
  
  
  pointLight(255,255,255,300,300,noise(da)*500);
  
  pushMatrix();
  translate(200, 0);
  
  float siz = map(noise(da),0,1,10,20);
  siz = 10;
  for (float y=0; y<600; y+=siz) {
    for (float z=500; z>wallZ; z-=siz) {
      
      float col = map(noise(y/10, z/100-da),0,1,0,255);
      fill(col);
      
      pushMatrix();
      translate(0, y, z);
      rotate(da);
      rotateX(da);
      
      box(siz);
      popMatrix();

      pushMatrix();
      translate(200, y, z);
      rotate(-da);
      rotateX(-da);
      
      box(siz);
      popMatrix();
      //da+=0.001;
    }
  }
  popMatrix();

  //lower
  fill(200, 150);
  pushMatrix();
  translate(0, 400, 300);
  box(1000, 1, -wallZ+600);
  popMatrix();
  
  //upper
  fill(55);
  pushMatrix();
  translate(0, 200, 300);
  box(1000, 1, -wallZ+600);
  popMatrix();
  
  //shadow
  fill(55);
  pushMatrix();
  translate(0, 500, 00);
  box(1000, 1, -wallZ+600);
  popMatrix();
  
  
  
  da+=0.015;
}
