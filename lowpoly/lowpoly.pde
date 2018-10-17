void setup() {
  size(600, 600, P3D);
  background(0);
}
int n=5;
float a=0;
ArrayList<PVector> ps=new ArrayList<PVector>();
void draw() {
  if (a%TWO_PI<1)
    background(0, 0, 20);
  float x=cos(a)*50*-sin(a)+300;
  float y=sin(a)*50+300;
  float z=sin(a)*sin(a)*50+100;
  strokeWeight(15);
  stroke(255);


  if (ps.size()<5) {
    PVector a=new PVector(random(x,y), random(y,z), random(z,x));
    ps.add(a);
  } else {
    ps.remove(0);
  }
  beginShape();
  for (int i=0; i<ps.size(); i++) {
    float al=map(i, 0, ps.size(), 255, 0);
    noStroke();
    fill(255, al, 100);
    PVector a=ps.get(i);
    vertex(a.x, a.y, a.x);
    vertex(random(a.x,a.y), random(a.y,a.z), a.x);
  }
  endShape();



  a=lerp(a, TWO_PI, 0.05);
  if (abs(a-TWO_PI)<0.2)
    a=0;
}
