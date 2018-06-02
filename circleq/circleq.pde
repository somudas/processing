int n=150;
Circle[] s=new Circle[n];
void setup(){
  size(600,600);
  background(250);
  for(int i=0;i<n;i++){
  s[i]=new Circle(random(50),new PVector(random(600),random(600))
  ,color(random(255),random(250),random(251)));
  }
}

void draw(){
  //background(250);
  if(frameCount<2000){
  for(int i=0;i<n;i++){
    s[i].update();
    s[i].display();
  }
}
}