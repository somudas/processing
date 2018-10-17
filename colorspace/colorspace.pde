PImage img;
PVector [][] col=new PVector[600][600];

void setup() {
  size(600, 600, P3D);
  //img=loadImage("1.jpg");
  background(0);
  //image(img, 0, 0);
  for (int x=0; x<600; x++) {
    for (int y=0; y<600; y++) {
      color c=get(x,y);
      println(c);
      col[x][y]=new PVector(random(255), random(255), random(255));
    }
  }
}
void draw() {
  background(0);
  for (int x=0; x<600; x++) {
    for (int y=0;y<600; y++) {
      stroke(col[x][y].x,col[x][y].y,col[x][y].z);
      float px=map(col[x][y].x,0,255,0,600);
      float py=map(col[x][y].y,0,255,0,600);
      
      point(px,py,col[x][y].z-500);
      col[x][y]=new PVector(random(255), random(255), random(255));
    }
  }
}
