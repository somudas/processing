int n=1000;
PImage img;
float [] x=new float [n];
float [] y=new float [n];

void setup(){
  size(600,600,P3D);
  background(0);
  img=loadImage("hello.png");
  for(int i=0;i<n;i++){
    x[i]=random(100,500);
    y[i]=random(100,500);
  }
  noLoop();
}

void gradient(color cl){
float ex=random(100);

translate(-5,0);
for(float i=0;i<ex;i++){
  translate(2,3);
  float a=map(i,0,ex,255,0);
  fill(cl,a);
  rect(0,0,17,3);
}


}

void draw(){
  background(255);
  image(img,0,0,600,600);
  noStroke();
  for(int i=0;i<n;i++){
    pushMatrix();
    
    translate(x[i],y[i]);
    //println((int)x[i]+"  "+y[i]);
    color c=get((int)x[i],(int)y[i]);
    gradient(c);
    
    popMatrix();
  }
 
  
}