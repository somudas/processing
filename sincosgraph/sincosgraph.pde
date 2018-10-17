void setup(){
  size(600,600);
  background(0);
}
float x=0;
float a=0;
void draw(){
  //background(0);
    
    float y=cos(a)*100+300;
    println(x,y);
  
    strokeWeight(5);
    stroke(134,55,x);
    point(x,y);
    x++;
    if(x>600){
      x=0;
      a+=600/0.1;
    }
    a+=0.1;
}
