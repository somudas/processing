PVector [] stars=new PVector[100];

void setup(){
  size(600,600,P3D);
  for(float x=0;x<100;x+=1){
    stars[(int)x]=new PVector(random(600),random(random(600)));
  }

}
float dy=0;
void draw(){
  background(00);
  float am=300;
  
  //  for(float x=00;x<600;x++){
  //  float h=map(noise(x/100),0,1,0,30);
  //  pushMatrix();
  //  translate(x,250-h);
    
    
  //  float ap=map(abs(300-x),0,300,255,0);
    
  //  fill(255-ap,ap);
  //  //ellipse(0,0,100,100);
  //  rect(0,0,1,h);
  //  popMatrix();
    
  //}
  noStroke();
  //pushMatrix();
  //translate(0,0,-300);
  //for(int y=0;y<100;y+=1){
  //  fill(255);
  //  ellipse(stars[y].x,stars[y].y,random(5),random(5));
  //}
  //popMatrix();
  
  translate(600,400,mouseX);
  
  rotate(PI);
  pushMatrix();
  float m=map(mouseY,0,600,1.5,3);
  rotateX(-PI/m);
  noStroke();
  directionalLight(255,255,255,0,0,-1);
  float yoffset=dy;
  for(float y=300-am;y<300+am;y+=10){
    float xoffset=0;
    for(float x=300-am;x<300+am;x+=10){
      float r=map(noise(xoffset,yoffset),0,1,25,255);
      float g=map(noise(xoffset+50,yoffset+50),0,1,5,55);
      float b=map(noise(xoffset+150,yoffset+150),0,1,250,255);
      float dis=dist(x,y,300,300);
      float alpha=map(dis,0,am,255,0);
       pushMatrix();
       translate(x,y,-g);
       fill(34,166,b,alpha);
       box(10,b/10,r/10);
       popMatrix();
       
      //fill(r,g,b,100);
      //rect(x,y,6,6);
      xoffset+=0.1;
    }
    yoffset+=0.1;
  }
    dy+=0.1;
   popMatrix();
   

  
}
