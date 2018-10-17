import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;





ArrayList<Particle> particles =new ArrayList<Particle>();
int n=10;
PVector[] rockets=new PVector[n];

PVector[] vel=new PVector[n];
PFont myfont;
PImage img; 
void setup(){
  size(600,600);
  background(255);
  String[] fontList = PFont.list();
  printArray(fontList);
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\Last Heroes - Dimensions.mp3");
  file.play();
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  img=loadImage("iphone.png");
  for(int i=0;i<n;i++){
    rockets[i]=new PVector(random(600),random(300));
    float v=random(random(-5.1,-2));
    vel[i]=new PVector(v,-v);
  }
  
  
  for(int i=0;i<1125;i++){
    ad();
  }
}
float da=1;
float dda=0.5;
float ddda=0.01;
float ca=0;
 float np=0;

void draw(){
  
  
  
  background(255);
  float spe=amp.analyze()*10+0.02;
  
  
  for(int i=0;i<n;i++){
    strokeWeight(1);
    stroke(0,100);
    PVector p=rockets[i];
    line(p.x,p.y,p.x-50,p.y+50);
    rockets[i].add(vel[i]);
    if(p.x<0){
      rockets[i]=new PVector(random(600),random(300));
      float v=random(random(-5.1,-2));
      vel[i]=new PVector(v,-v);
    }
  
  }
  
  
  
  strokeWeight(1);
  stroke(0);
  
  
  
  
  
  float offset=0;
  float anoffset=0;
  for(int x=0;x<600;x++){
    pushMatrix();
    translate(0,0);
    float y=map(noise(offset),0,1,600-x/3,550-x/3);
    float y2=map(noise(anoffset),0,1,550-(600-x)/3,600-(600-x)/3);
    stroke(100);
    line(x,y2,x,650);
    stroke(0);
    line(x,y,x,650);
    
    offset+=0.01;
    anoffset+=0.01;
    popMatrix();
  }
  //int i=0;
  //for(Particle p:particles){
    
  // //Particle p =particles.get(i-2); 
  //  p.update();
  //  p.display();
    
  //  i++;
  //}
  //particles.remove(0);
  //ad();
  
  float xoffset=da;
  for(int x=0;x<600;x+=2){
    float yoffset=0;
    for(int y=0;y<600;y+=2){
      float a=map(y,0,600,0,255);
      float al=map(noise(xoffset,yoffset),0,1,00,a);
      fill(255,al);
      noStroke();
      rect(x,y,2,2);
      yoffset+=0.01;
    }
    xoffset+=0.01;
  }

  da-=spe;
  if(dda>0.1){
    dda-=ddda;
    dda-=ddda;

  }
  //image(img,170,50,364/1.5 ,727/1.5);
 
  fill(0);
 
 
  for(float a=0;a<6.28;a+=0.1){
    float r2=map(noise(ca),0,1,50,100);

    float x=cos(a)*r2+300;
    float y=sin(a)*r2+300;
    float r=map(sin(x+np),-1,1,10,50);
    
    stroke(0);
    //line(x,y,300,300);
    //vertex(x,y);
    ellipse(x,y,r,r);
    ellipse(300,300,r2*2,r2*2);
    //np+=0.1;
  }
  endShape();
  ca+=spe*10; 
  np+=0.3;
  fill(255);
  stroke(255);
  myfont = createFont("Script MT Bold", 50);
  textFont(myfont);
  textAlign(CENTER, CENTER);
  text("", width/2, height/2-10);
  
  
  
}

void ad(){
  PVector pos=new PVector(random(10),600);
    PVector vel=new PVector(random(-1,1),random(-0.1));
    PVector acc=new PVector(random(-0.001,0.001),random(-0.001));
    Particle p=new Particle(pos,vel,acc);
    particles.add(p);
}
