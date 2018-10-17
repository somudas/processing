int n=15;
float [] speed=new float[n];

void setup(){
  size(600,600,P3D);
  background(0);
  for(int i=0;i<n;i++){
    speed[i]=(i+1)/100;
  }
  
}
void gradient(float x,float y){
    
    float i=x;
    for(float a=3;a<TWO_PI;a+=0.1){
      float al=map(sin(a),-1,1,0,255);
      
      fill(255,225,25,al);
      rect(i,y,2,10);
      i++;
    }
    

}
void draw(){
  background(0);
  noStroke();
  translate(300,300,-100);
  for(int x=10;x<=n*10;x+=10){
    float da=map(x,10,100,0.5,0.2);
    for(float a=speed[x/10-1];a<TWO_PI+speed[x/10-1];a+=da){
      //a=map(noise(a),0,1,a+1,a-1);
      rotate(a);
      gradient(x,0);
    }
    speed[x/10-1]-=0.001;
  }
  

}
