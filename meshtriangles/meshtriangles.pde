int n=15;
PVector[] points=new PVector[n];
PVector[] speed = new PVector[n];
PVector[] col = new PVector[n];
float w,h;
void setup(){
  size(1000,600,P3D);
  background(250);
  w=width/2;
  h=height/2;
  for(int i=0;i<n;i++){
    points[i]=new PVector(random(w-100,w+100),random(h-100,h+100),random(-100,00));
    speed[i]=new PVector(random(-1,1),random(-1,1),random(-1,1));
    col[i]=new PVector(random(66),random(165),255);
    
  }  
}

void draw(){
  background(255);
  noStroke();
  for(int i=0;i<n;i++){
    
    fill(col[i].x,col[i].y,col[i].z);
    
    beginShape(TRIANGLE_STRIP);
    for(int j=0;j<n;j++){
      
      float d=dist( points[i].x, points[i].y,points[i].z,points[j].x,points[j].y,points[j].z);
        
        if(d<250){      
          vertex(
            points[i].x,
            points[i].y,
            points[i].z);
          vertex(
            points[j].x,
            points[j].y,
            points[j].z
            );
        }
    }
    endShape(CLOSE);
    points[i].add(speed[i]);
    
    if(points[i].x<w-100 || points[i].x>w+100){
      speed[i].x=-speed[i].x;
    }

    if(points[i].y<h-100 || points[i].y>h+100){
      speed[i].y=-speed[i].y;
    }
    
    if(points[i].z<-100 || points[i].z>100){
      speed[i].z=-speed[i].z;
    }
    
  }
  

}
