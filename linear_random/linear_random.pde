void setup() {
  size(600, 600, P3D);
  background(0);
}
float da=0;
void draw() {
  
  if(mousePressed)
    background(0);
  
  
  //strokeWeight(0.5);
  stroke(255);
  noStroke();
  pointLight(55,255,255,300,300,0);
  for (float x=100; x<500; x++) {
    float n=map(x,100,500,0,10);
    for (float i=0; i<n; i+=2) {
      translate(300,300);
      //rotateY(i);
      rotate(-i);
      rotateX(i);
      
      translate(-300,-300);
      float pY = random(100, 500);
      pY *= noise(i,x);
      pushMatrix();
      rotateY(da);
      translate(x, pY);
      
      box(10);
      popMatrix();
    }
  }
  da+=0.1;
  //noLoop();

  
}
