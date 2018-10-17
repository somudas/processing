int n=125;

PVector[] pos=new PVector[n];
PVector[] vel=new PVector[n];
PVector[] acc=new PVector[n];


void setup() {  
  size(600, 600);
  background(0);

  for (int i=0; i<n; i++) {
    pos[i]=new PVector(random(600), random(600));
    float a=0.25;
    //vel=new PVector(random(-1, 1), random(-1, 1));
    acc[i]=new PVector(random(-a, a), random(-a,a));

    vel[i]=PVector.sub(new PVector(300, 300), pos[i]);
    vel[i].normalize();
  }
  //vel.mult(-1);
  //vel.mult(5);
}
float offset=0;
void draw() {
  background(0);
  
  stroke(255, 55, 100);
  for (int i=0; i<n; i++) {
    strokeWeight(5);
    point(pos[i].x, pos[i].y);
    strokeWeight(0.5);
    stroke(255);
    for (int j=0; j<n; j++) {
      float d=dist(pos[i].x, pos[i].y, pos[j].x, pos[j].y);
      if (d<55)
        line(pos[i].x, pos[i].y, pos[j].x, pos[j].y);
    }

    //line(pos[i].x,pos[i].y,300,300);

    if (pos[i].x<310 && pos[i].x>290 || ( pos[i].x<0 || pos[i].x>600)  )
      vel[i].x=-vel[i].x;
    if (pos[i].y<310 && pos[i].y>290  ||  ( pos[i].y<0 || pos[i].y>600))
      vel[i].y=-vel[i].y;
    float dis=dist(pos[i].x, pos[i].y, 300, 300);
    float velMap=map(dis, 0, 300, 0, 20);

    //vel=PVector.sub(new PVector(300,300),pos);
    //vel.div(52);

    pos[i].add(vel[i]);
    //vel.mult(velMap);
    float a=noise(pos[i].x, pos[i].y);
    a=sin(offset)*5;
    vel[i]=new PVector(random(-a, a), random(-a,a));
    float l=20;
    if (vel[i].x>l || vel[i].y>l || vel[i].x<-l || vel[i].y<-l) {
    } else {
      vel[i].add(acc[i]);
    }
    
  }
  offset+=0.01;
  
  //acc.mult(20);
}
