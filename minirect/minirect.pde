void setup(){
  size(600,600);
  background(0);
  noLoop();
}

void draw(){
  noStroke();
  for(int i=0;i<200;i++){
    fill(66,204,254,random(255));
  rect(random(600),random(600),random(50),random(50));
  }
}