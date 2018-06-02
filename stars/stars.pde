int n=70;
PVector [] stars,speed,acc;
void setup(){
  size(600,600);
  background(0);
  stars=new PVector[n];
  speed=new PVector[n];
  acc=new PVector[n];
  for(int i=0;i<n;i++){
    stars[i]=new PVector(random(600),random(600));
    speed[i]=new PVector(random(-1,1),random(-1,1));
    acc[i]=new PVector(random(-0.25,0.25),random(-0.25,0.25));
  }
}
void draw(){
  background(0,6,23);
  stroke(255);
  update();
  for(int i=0;i<n;i++){
    ellipse(stars[i].x,stars[i].y,1,1);
  }  
  strokeWeight(0.02);
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      float d=dist(stars[i].x,stars[i].y,stars[j].x,stars[j].y);
      if(d<100){
        line(stars[i].x,stars[i].y,stars[j].x,stars[j].y);
      }
    }
  }
}
void update(){
  for(int i=0;i<n;i++){
    stars[i].add(speed[i]);
    //speed[i].add(acc[i]);
    if(stars[i].x>600 || stars[i].x<0){
      speed[i].x=-speed[i].x;
      acc[i].x=-acc[i].x;
    }
   if(stars[i].y>600 || stars[i].y<0){
      speed[i].y=-speed[i].y;
      acc[i].y=-acc[i].y;
    }
  }
}
