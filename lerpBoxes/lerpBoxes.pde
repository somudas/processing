int n=50;

PVector vel[][]=new PVector[n][n];

int inc=5;
void setup() {
  size(600, 600, P3D);
  background(0);
 
  float temp=0;
  int xo=0;
  for (float x=200; x<400; x+=inc) {
    int yo=0;
    for (float y=200; y<400; y+=inc) {
      float t=random(100);
      if (t>temp)
        temp=t;
      vel[xo][yo]=new PVector(random(1), t, random(150));
      yo+=1;
    }
    xo+=1;
  }
  h=temp;
  //randomSeed(1);
}
float da=0;
float h;
boolean bck=false;
void draw() {
  if(bck){
    background(0);
    directionalLight(55, 105, 255, 0, 1, -1);
  }
  else{
    directionalLight(55, 105, 255, 0, 1, 0);
  }
  if(mousePressed){
    bck=!bck;
  }
  noStroke();
  fill(255);
  
  translate(300, 300,-300);
  rotateX(-PI/12.12);
  //rotate(frameCount/100.0);
  translate(-300, -300+da);
  da=lerp(da, h, 0.1);
  h+=random(10.45);
  int xo=0;
  for (float x=200; x<400; x+=inc) {
    int yo=0;
    for (float y=200; y<400; y+=inc) {
      PVector v=vel[xo][yo];
      pushMatrix();
      if (v.x>0) {
        translate(x, y-v.y/2,y);
        rotateY(frameCount/100.0);
        box(9, v.y,9);
        v.y=lerp(v.y, v.z, 0.1);
        v.z+=random(10);
      } 
      popMatrix();
      yo++;
    }
    xo++;
  }
}
