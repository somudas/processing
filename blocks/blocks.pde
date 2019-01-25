int nz=100;
int nx=50;
PVector[][] pos=new PVector[nz][nx];
boolean [][] red=new boolean[nz][nx];
void setup() {
  size(600, 600, P3D);
  background(0);

  for (int z=0; z<nz; z++) {
    for (int x=0; x<nx; x++) {
      pos[z][x]=new PVector(random(600), z*10, random(50));
      red[z][x]=random(1)>0.5?true:false;
    }
  }
}
float da=0;
void draw() {
  background(5);
  directionalLight(255, 255, 255, 0, 1, -1);
  // pointLight(255,255,255,300,300,400);
  translate(300, 300);

  rotateX(PI/2.5);
  rotateY(-da);
  rotateX(sin(da)*da);
  rotate(-da);
  translate(-300, -100);
  translate(300,300);
  noStroke();
 
  float aoff=0;
  for (int z=0; z<nz; z++) {
    aoff+=1;
    for (int x=0; x<nx; x++) {
      PVector a=pos[z][x];
      float an=map(x, 0, nx, 0, TWO_PI);
      fill(80);
      if(red[z][x])
        fill(242, 99, 99);
      
      pushMatrix();
      
      rotateY(an+aoff);
      
      translate(a.x, a.y);
      rotateZ(-an);
      box(5, 5, a.z);
      popMatrix();

      pos[z][x].y+=0.5;
      if (pos[z][x].y>300){
        pos[z][x].y*=-1;
        pos[z][x].x*=0.71;
        
      }
        
    }
  }
  da+=0.001;
}
