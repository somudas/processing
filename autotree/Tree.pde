class Tree{

  float x,y,z;
  float a,a2;
  float np=0;
  float l=0;
  float rP;
  float r,g,b;
  Tree(float _x,float _y,float _z,float _l){
    x=_x;
    y=_y;
    z=_z;
    l=_l;
    r=random(255);
    b=random(255);
    g=random(255);
    rP=random(10);
    np=random(-10000,10000);  
  }
  
  void display(){
    pushMatrix();
    
    translate(x,y,z);
    recursive(l);
    popMatrix();
    //println(frameCount);
    np+=0.01;
  }
  void recursive(float len){
    strokeWeight(0.51);
   if(len>10)
    stroke(247, 94, 0);
    else{
      strokeWeight(2);
  
          stroke(r,g,b);
      
    }
    line(0, 0, 0, -len);
    translate(0, -len);
  
  
  
  if (len > 4) {
    pushMatrix();
    rotate(angle);
    a=map(noise(np),0,1,-PI,PI);
    rotateX(-a);
    rotateY(a);
    rotateZ(-a);
    recursive(len * 0.67);
    popMatrix();
    pushMatrix();
    rotate(-angle);
    a2=map(noise(np+random(0.00001)),0,1,-PI/3,PI);
    rotateX(a2);
    rotateY(-a2);
    rotateZ(a2);
    recursive(len * 0.67);
    popMatrix();
    np+=0.000001;
  }
  }
}
