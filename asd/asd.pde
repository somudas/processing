float [][]np=new float[600][600];

void setup(){
  size(600,600);
  background(0);
  
  for(int y=0;y<600;y+=5){
    for(int x=0;x<600;x+=5){
      np[x][y]=random(100);
    
    }
  
  }
}
void draw(){
  background(0);
  noStroke();
  
  for(int y=0;y<600;y+=5){
    for(int x=0;x<600;x+=5){
        float cn=np[x][y];
        float al=map(noise(y+x+cn/frameCount),0,1,0,255);
        fill(al*01.0,al*.75,al*2);
        rect(x,y,5,5);
    }
  }
  
  for(int y=0;y<600;y+=5){
    for(int x=0;x<600;x+=5){
      np[x][y]+=0.1;
    
    }
  
  }
}
