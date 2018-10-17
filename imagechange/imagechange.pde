PImage img1,img2;
ArrayList <PVector> change=new ArrayList<PVector>();
ArrayList <PVector> vel=new ArrayList<PVector>();


void setup(){
  size(600,600);
  background(0);
  img1=loadImage("1.png");
  img2=loadImage("2.png");
  

  for(int x=0;x<600;x++){
    for(int y=0;y<600;y++){
      PVector pos=new PVector(x,y);
      
      image(img1,0,0);
      color a=get(x,y);
      PVector c=new PVector(a,0);
      image(img2,00,0);
      color b=get(x,y);
      PVector d=new PVector(b,0);
      
      if(a!=b){
        change.add(pos);
        
      }
      
      
    }
  }
  println(change.size());
}
void draw(){

}
