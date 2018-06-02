import peasy.*;

PeasyCam cam;
int prob=5;
int l=0;
boolean[] bl=new boolean[1445];
PVector[][] globe;
int total = 35;
boolean[][] d=new boolean[total+1][total+1];
void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  colorMode(RGB);
  globe = new PVector[total+1][total+1];
  float r = 200;
  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, 0, PI);
    for (int j = 0; j < total+1; j++) {
      float lon = map(j, 0, total, 0, TWO_PI);
      float x = r * sin(lat) * cos(lon);
      float y = r * sin(lat) * sin(lon);
      l++;
      float z = r * cos(lat);
      globe[i][j] = new PVector(x, y, z);
      if(random(10)>prob){
      d[i][j]=true;
      bl[l]=true;
      }else{
      d[i][j]=false;
      bl[l]=false;
      }
    }
  }
  println(l);
  directionalLight(255,255,255,0,0,0);
  background(0);
}

void draw() {
  background(00,00,20);
  noStroke();
  noFill();
  //translate(random(10),random(10));
  
  

  for (int i = 0; i < total; i++) {
    float hu = map(i, 0, total, 0, 255*6);
    stroke(34,166, 255);
    //stroke(255);
    strokeWeight(0.4);
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total+1; j++) {
      if(d[i][j]){
      PVector v1 = globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
      //point(v2.x, v2.y, v2.z);
    }
    }
    endShape();
  }
  stroke(66,134,255);

  PVector[] cor=new PVector[l];
  int co=0;
  for (int i = 0; i < total; i++) {
    for (int j = 0; j < total+1; j++) {
      strokeWeight(8);
      co++;
      if(d[i][j]){
        PVector v1 = globe[i][j];
        cor[co]=v1.get();
        pushMatrix();
        translate(v1.x, v1.y, v1.z);
        stroke(100,20,50);
        point(0,0,0);
        popMatrix();
      }
    }
  }

  
}