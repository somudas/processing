int n=100;
PVector[] pos=new PVector[n];
PVector[] vel=new PVector[n];
PVector[] acc=new PVector[n];
void setup(){
  size(600,600);
  background(0);
  for(int i=0;i<n;i++){
    pos[i]=new PVector(random(600),random(600));
    PVector q=new PVector(300,300);
    vel[i]=PVector.sub(q,pos[i]);
    vel[i].normalize();
    acc[i]=new PVector(vel[i].x/10000,vel[i].y/10000);
  }

}


void draw(){
  background(0);
  stroke(255);
  for(int i=0;i<n;i++){
   rect(pos[i].x,pos[i].y,10,10);
   //if(pos[i].x<280 && pos[i].x>320 && pos[i].y<280 && pos[i].y>320 ){
    float dx=dist(pos[i].x,pos[i].y,300,300);
    if(dx>1)
    {
     //println(pos[i].x+" "+pos[i].y);
     if(dx<50){
     vel[i].add(acc[i]);}
     pos[i].add(vel[i]);
    }
  }
}