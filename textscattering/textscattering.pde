PFont myFont;

ArrayList<PVector> coords=new ArrayList<PVector>();

ArrayList<PVector> init=new ArrayList<PVector>();
ArrayList<PVector> vel=new ArrayList<PVector>();



int siz=3;

void setup(){
  size(600,600,P3D);
  background(0);
  String[] fontList = PFont.list();
  printArray(fontList);
  myFont = createFont("Impact", 32);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  textSize(60);
  text("Hello", width/2, height/2);
  text("World",300,360);
  for(int x=0;x<600;x+=siz){
    for(int y=0;y<600;y+=siz){
      color c=get(x,y);
      fill(c);
      if(c==-1){
        PVector a=new PVector(x,y);
        coords.add(a);
      }
    }
  }
  
  for(PVector xc:coords){
    PVector s=new PVector(random(600),random(600));
    PVector v=PVector.sub(s,xc);
    
    vel.add(v);
    init.add(s);
  }
  
  
}
void draw(){
  background(255);
  noStroke();
  rotateX(PI/10);
  if(frameCount>10)
    frameCount=10;
  fill(0);
  for(int i=0;i<coords.size();i++){
    PVector pos=init.get(i);
    PVector v=vel.get(i);
    PVector des=coords.get(i);
    float con=dist(des.x,des.y,pos.x,pos.y);
    
    
    ellipse(pos.x,pos.y,siz,siz);
    
    v=PVector.sub(coords.get(i),pos);
    v.normalize();
    
    v.mult(con/20);
    pos.add(v);
    
    init.set(i,pos);
    
  }
  
  
  
  
  

}
