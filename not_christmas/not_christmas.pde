PFont font;
void setup() {
  size(600, 600, P3D);
  background(0);
  String[] fontList = PFont.list();
  printArray(fontList);
  font=createFont("Lobster1.3",30);
}
float da=0;
float rad=0;
float moveUp=200;
float mu=0;
void draw() {
  background(0);

  noStroke();
  translate(0, moveUp,0);

  pointLight(255, 255, 255, 200, 300, 100);

  directionalLight(55, 55, 55, 0, 0, -1);

  //building a christmas tree
  christmasTree();
  
  
  
  //ball
  pushMatrix();
  translate(300, 90);
  sphereDetail(5);
  noFill();
  stroke(255, 100, 0);
  sphere(noise(da)*30);
  popMatrix();

  
  float siz=map(sin(da),-1,1,10,70);
  //text
  noStroke();
  fill(255,255);
  translate(300,-300);
  ellipse(0,0,siz*5,siz*5);
  stroke(255);
  
  fill(0);
  
  textFont(font);
  textAlign(3);
  textSize(siz);
  text("Merry\nChristmas", 0, -20);

  moveUp=map(sin(mu),-1,1,0,600);
  mu+=0.02;
  
}

void christmasTree() {

  for (float y=100; y<500; y+=10) {
    pushMatrix();
    
    translate(300, y, 0);
    
    float np=da;
    float r=map(noise(y/10), 0, 1, y/50, y/5);
    
    for (float a=0; a<=TWO_PI; a+=0.1) {
      float green=map(noise(np), 0, 1, 100, 255);
      float red=map(noise(np+10), 0, 1, 00, 55);

      fill(red, green, 0);
      rotateY(0.1);
      pushMatrix();

      translate(r, 0);
      rotateX(-1);
      rotateY(1);
      //rotateX(-x/r);
      float nInc=noise(np)*r;

      box(r/10, nInc, r/10);

      popMatrix();
      np+=0.5;
    }

    popMatrix();
    da+=0.001;
  }
  pushMatrix();
  translate(300, 500);
  rotateY(-da/10);
  fill(255, 100, 55);
  box(30, 100, 30);
  popMatrix();
  
  
}
