float[] corX=new float [3];
float[] corY=new float [3];
float q=10;
float qy=100;
ArrayList <Float> cx=new ArrayList<Float>();
ArrayList <Float> cy=new ArrayList<Float>();

void setup(){
  size(600,600);
  for(int i=0;i<3;i++){
    
    
    increment();
  }
  //frameRate(5);
  background(0,0,20);
}
void increment(){
  float a=map(noise(q),0,1,-100,800);
  float b=map(noise(qy),0,1,-100,800);
  cx.add(a);
  cy.add(b);
  q+=0.01;
  qy+=0.02;
}
void draw(){
  //background(250);
  noStroke();
  //fill(0);
 
  beginShape();
  
  for(int i=0;i<cx.size();i++){
    float w=cx.get(i);
    float e=cy.get(i);
    
     fill(random(234),random(166),random(244),100);
    vertex(w,e);
  }
  endShape();
  increment();
  if(random(10)>5){
  cx.remove(0);
  cy.remove(0);
  }
}