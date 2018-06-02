int x,y;
int scl=20;
int h,w;
int cols,rows;
float z[][];
float r[][];
float g[][];
float b[][];
//float sx,sy;
float fy;
void setup(){
  size(600,600,P3D);
  h=600;
  w=1600;
  cols=w/scl;
  rows=h/scl;
  z=new float[h][w];
   r=new float[h][w];
    g=new float[h][w];
     b=new float[h][w];
     
  frameRate(1000);
  //noLoop();
}

void draw(){
  background(0,37,80);
  //background(0);
  fy-=0.5;
  float yoff=fy;
  for(int a=0;a<h;a++){
    float xoff=0;
    for(int j=0;j<w;j++){
      float hi=map(noise(xoff,yoff),0,1,-40,50);
      float rc=map(noise(xoff+0.5,yoff+0.5),0,1,0,255);
      float gc=map(noise(xoff+1,yoff+1),0,1,0,255);
      float bc=map(noise(xoff+1.5,yoff+1.5),0,1,0,255);
      
    z[a][j]=hi;
    r[a][j]=rc;
    g[a][j]=gc;
    b[a][j]=bc;
    xoff+=0.5;
    
    }
    yoff+=0.5;
  
  }
  
  stroke(0,100);
  noStroke();
  fill(204, 72, 20,180);
  translate(600/2,600/2);
  //float sx=map(mouseY,0,600,-2,2);
  //float sy=map(mouseX,0,600,-2,2);
   rotateX(PI/3);
  //rotateX(PI/sx);
  //rotate(PI/sy);
  
  translate(-600,-50);
  
  for(y=0;y<rows;y++){
    beginShape(TRIANGLE_STRIP);
    for(x=0;x<cols;x++){
      //,z[y][x]
      stroke(r[y][x],g[y][x],b[y][x]);
      fill(r[y][x],g[y][x],b[y][x]);
      vertex(x*scl,y*scl,z[y][x]);
      stroke(r[y+1][x],g[y+1][x],b[y+1][x]);
      fill(r[y+1][x],g[y+1][x],b[y+1][x]);
      vertex(x*scl,(y+1)*scl,z[y+1][x]);
      
    }
    endShape();
  
  }

}