int n=1025;
Bubble[] bubbles=new Bubble[n];
void setup(){
  size(600,600);
  background(0);
  for(int i=0;i<n;i++){
    bubbles[i]=new Bubble(random(600),600,random(100));
  }
}
void draw(){  
  background(0);
  stroke(255);
  noFill();
  for(int i=0;i<n;i++){
    bubbles[i].update();
    bubbles[i].display();
    //println(bubbles[i].s);
  }


}
