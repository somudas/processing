int n=10;
PVector [] vertices=new PVector[n];
PVector[] col=new PVector[n];
float []side=new float[n];
void setup(){
  size(600,600);
  for(int i=0;i<n;i++){
    vertices[i]=new PVector(random(600),random(600));
    col[i]=new PVector(random(255),random(255),random(255));
    side[i]=floor(random(4))+1;
    
  }

}

void draw(){
  background(255);
  noStroke();
  for(int i=0;i<n;i++){
    fill(col[i].x,col[i].y,col[i].z,100);
    switch((int)side[i]){
    case 1:
    triangle(0, 0, vertices[i].x, vertices[i].y, 0, 600);
    break;
    
    case 2:
    triangle(0, 0, vertices[i].x, vertices[i].y, 600, 00);
    break;
    
    case 3:
    triangle(600, 600, vertices[i].x, vertices[i].y, 600, 00);
    break;
    
    case 4:
    triangle(600, 600, vertices[i].x, vertices[i].y, 0, 600);
    break;
    
    }
    vertices[i].add(new PVector(random(-2,2),random(-2,2)));
  }

}