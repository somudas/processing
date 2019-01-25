int n=15;
PVector[] pts=new PVector[n];

float x=random(600);
float y=random(600);
float z=random(-200);

void setup() {
  size(650, 650, P3D);
  background(250);
  for (int i=0; i<n; i++) {
    pts[i]=new PVector(random(width), random(height), random(-200));
  }
  
}
int prev;
float da=0;
void draw() {
 
  noFill();
  strokeWeight(1);

  da+=0.01;
  for (int i=0; i<n; i++) {

    int ran=(int)random(n);
    
    if (ran!=prev) {
      for (int j=0; j<n; j++) {
        
        if (ran==j) {

          PVector a=pts[j];   
          
          x=lerp(x, a.x, 0.25);
          y=lerp(y, a.y, 0.75);
          z=lerp(z, a.z, 0.1);
          
          float alp=map(x,0,600,0,55);
          stroke(0,alp);
          translate(width/2,height/2);
          rotate(da);
          //rotateY(-da/100);
          translate(-width/2,-height/2);
          
          line(x, y, a.x, a.y);
          
          
        }
      }
    }
    prev=ran;
  }
  
}
