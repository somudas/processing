PImage img;
PImage gr;
float x=-500;
float dx=03;
float ax=0.5;
ArrayList<Particle> pSystem;
void setup(){
  size(1200,500);
  gr=loadImage("g2.jpg");
  img=loadImage("1.png");
  pSystem=new ArrayList<Particle>();
}

void draw(){
  background(255);
  image(gr,-100,200);
  image(gr,100,200);
  image(gr,300,200);
  image(img,x,200);
  x+=dx;
  
  stroke(0);
  strokeWeight(3);
  line(0,390,width,390);
   for(int i=0;i<100;i++){
    Particle p=new Particle(new PVector(375+(x+500),195),color(0));
    pSystem.add(p);
  }
  for(int i=pSystem.size()-1;i>0;i--){
    Particle w=pSystem.get(i);
    if(!w.alive()){
    pSystem.remove(i);
    }
  }
  
  for(Particle ps:pSystem){
   ps.show();
   ps.update();
    
  }
}