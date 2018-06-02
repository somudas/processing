void setup(){
  size(600,600);
  background(2);
  
}

boolean top=true;
float x=100;
void draw(){
  fill(244,66,113);
  noStroke();
  if(top){
  fill(random(244),66,113);
    top=!top;
  rect(x,0,1,random(300));
  }else{
  top=!top;
  fill(random(244),66,113);
  rect(x,600-random(300),1,600);
  
  }
  if(x<500){
  x++;
}
}