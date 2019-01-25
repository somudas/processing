void setup() {
  size(600, 600, P3D);
  background(0);
}
float am=0,tam=10;
void draw() {
  background(250);
  noFill();
  strokeWeight(0.51);
  am=lerp(am,tam,0.01);
  //tam=random(60);
  float a=0;
  for (float i=0; i<1000; i+=50) {
    float da=a;
    rotateY(-a);
    for (float x=0; x<600; x++) {
      rotateX(a/100-da/1000);
      float f=map(noise(i/100),0,1,0,255);
      stroke(i/2, i/5, f);
      float y=map(noise(da), 0, 1, i, i+50);
      rectMode(3);
      rect(x,y,y,100);
      //line(x, y, x, 600);
      da+=am/1000;
    }
    a++;
  }
  
}
