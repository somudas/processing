
int n=200;

PVector [] pos = new PVector[n];
PVector [] vert = new PVector[n]; 
float [] angs = new float[n];
PVector [] colors = new PVector[5];

float wallZ = -100;

float angle=0;

void setup() {
  size(600, 600, P3D);
  background(0);

  for (int i=0; i<n; i++) {
    pos[i] = new PVector(random(600), 500, random(500));
    vert[i]=new PVector(random(200), pos[i].z-wallZ+pos[i].y, wallZ);
    angs[i] = pos[i].x;
  }
  //color scheme 1
  colors[0] = new PVector(11,199,177);
  colors[1] = new PVector(241,240,226);
  colors[2] = new PVector(217,187,116);
  colors[3] = new PVector(242,86,82);
  colors[4] = new PVector(5,69,73);
  
  
}

float da=0;
void draw() {
  
  background(30);

  pointLight(255,255,255,300,300,0);
  noStroke();
  fill(20);
 
  
  //creating the wall 
  pushMatrix();
  translate(300, 300, wallZ);
  box(1000, 1000, 1);
  translate(0, 200);
  fill(30);
  box(1000, 1, 1000);
  popMatrix();

  for (int i=0; i<n; i++) {
    
    PVector a = pos[i];
    PVector b = vert[i];
    PVector c = colors[i%5];
    
    fill(c.x,c.y,c.z);
    //fill(0,255,205);
    pushMatrix();
    float in = map(sin(angle),-1,1,5,2);
    
    translate(a.x, a.y, a.z);
    rotate(in);
    float w = 5;
    box(w, 15, b.x);
    popMatrix();


    pushMatrix();
    translate(a.x, b.y, b.z);
    rotateY(in);
    box(w, b.x, 15);
    popMatrix();

    angle = map(a.z,angs[i],wallZ,0,PI);
    
    
   
    a.z+=in;
    b.y+=in;

    if (a.z<-800) {
      pos[i] = new PVector(random(600), 500, random(500,600));
      vert[i]=new PVector(vert[i].x, pos[i].z-wallZ+pos[i].y, wallZ);
      angs[i] = pos[i].x;
    }
    
  }
  
  da+=0.1;
}
