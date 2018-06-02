int n=50;
Splash[] s=new Splash[n];
void setup(){
  size(600,600);
  for(int i=0;i<n;i++){
  s[i]=new Splash(new PVector(random(250,350),random(250,350))
  ,color(random(255),random(250),random(255)),random(20,40));
  }
}

void draw(){
  background(255);
  for(int i=0;i<n;i++){
    s[i].update();
    s[i].display();
  }
}