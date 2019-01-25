class Blast {

  int n=100;
  PVector[] pos=new PVector[n];
  PVector[] vel=new PVector[n];
  PVector[] acc=new PVector[n];
  float da=1;

  PVector c[]=new PVector[n];

  Blast() {

    

    for (int i=0; i<n; i++) {
      float s=10;
      pos[i]=new PVector(300, 300, 0);
      c[i]=new PVector(random(1), 55, 255);
      vel[i]=new PVector(random(-s, s), random(-s, s), random(-s, s));
      acc[i]=new PVector(0, random(0.21), 0);
    }
  }

  void show() {

    da=lerp(da, 0, 0.01);
    float an=0;
    for (int i=0; i<n; i++) {
      PVector a=pos[i];
      pushMatrix();
      
      translate(a.x, a.y, a.z);

      fill(256, 101, 93);
      if(c[i].x>0.5)
        fill(66,166,255);


      box(5);
      popMatrix();

      pos[i].add(vel[i]);
      vel[i].add(acc[i]);

      vel[i].mult(da);
      //acc[i].mult(da);

      an+=0.01;
    }
  }
}
