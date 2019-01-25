int n=100;
float yPos[]=new float[n];

void setup(){
  size(600,600,P3D);
  background(0);
  for(int i=0;i<n;i++){
    yPos[i]=i*10;
  
  }
}
float da=0;
float dda=0.01;
void draw(){
  background(0);
  noFill();
  float nV=(float)frameCount/10;
 
  
  noStroke();

  fill(255);

  translate(0,0,-100);
  //rotateX(nV/100);
  pointLight(55,155,255,00,noise(nV/10)*600,0);
  directionalLight(55,55,55,0,1,-1);
  pointLight(55,155,255,00,da+noise(nV/10)*600,0);
  
  da+=dda;
  //dda+=sin(da);
  
    
  for(int i=0;i<n;i++){
    float y=yPos[i];
    pushMatrix();
    translate(300,y,0);
    float r=map(noise(nV+y/100),0,1,0,200); 
    //r=100;
    for(float a=0;a<TWO_PI;a+=0.1){
      float z=cos(a)*r;
      float x=sin(a)*r;
      pushMatrix();
      translate(x,0,z);
      rotateY(nV/10);
      rotateX(nV/10);
      box(10,100,10);
      popMatrix();
    }
    popMatrix();
  
    yPos[i]+=1;
    if(yPos[i]>600)
      yPos[i]=0;
  }


}
