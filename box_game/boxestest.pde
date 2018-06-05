PVector [][] pos=new PVector[2][5];
float angle=0;

ArrayList<PVector> bullets=new ArrayList<PVector>();

float obstacleSpeed=10;

PVector amm;

boolean crash=false;
int crashframe=0;
int ammo=300;
int lives=5;
boolean died=false;
int score=0;

int kills=0;

PImage ammoI;
PImage life;
PImage replay;

void setup(){
  size(600,600,P3D);
  background(200,200,255);
  for(int y=0;y<2;y++){
    for(int x=0;x<5;x++){
      pos[y][x]=new PVector(random(200,400),270,random(0,200)-200);
    }
  }

  
  amm=new PVector(random(200,400),240,random(0,200)-200);
  
  ammoI=loadImage("ammo.png");
  life=loadImage("heart.png");
  replay=loadImage("replay.png");
}
void draw(){

  background(200,200,255);

  if(died){
    endScreen();
  }else{
 
  if(crashframe<20){
    crashframe++;
    glitch(5);
  }
    if(!died){
      mainHappen();
    }
  }
   
  
}

void glitch(int n){
  translate(random(-n,n),random(-n,n),random(-n,n));
  //if(frameCount%n==0){
  //  background(200,200,255);
  //}
}


void endScreen(){
  int w=10;
  float aX=map(mouseX,0,600,-PI/w,PI/w);
  float aY=map(mouseY,0,600,-PI/w,PI/w);
  pushMatrix();
  translate(300,300,-50);
  rotateX(aY);
  rotateY(aX);
 
  noStroke();
  //rotateX(PI/15);
  rectMode(3);
  fill(255,100);
  rect(00,0,300,300);
  
  popMatrix();
  stroke(0);
  fill(0);
  textSize(21);
  textAlign(CENTER);
  text(" Your Score :",300,200);
  text("Kills:",300,300);
  textSize(42);
  text(score,300,250);
  text(kills,300,350);
  
  image(replay,280,380);
  
  
  if(mousePressed && mouseX<331 && mouseX>270 && mouseY>370 && mouseY<430){
    died=false;
    init();
  }
  
}

void init(){
  lives=5;
  ammo=300;
  score=0;
  frameCount=0;
  kills=0;
}






void mainHappen(){
  score=(int)frameCount/5;
  fill(05);
  textSize(32);
  text(score,width-20,35);
  
  
  textSize(20);
  fill(5);
  image(ammoI,width-30,50,20,20);
  text(ammo,width-30,68);
  
  
  image(life,width-30,80,20,20);
  textAlign(RIGHT);
  text(lives,width-32,95);
  
  rectMode(CORNER);
  
  fill(0,200);
  rect(width-30,105,20,20);
  text(kills,width-32,120);
  
  fill(255);
  noStroke();
  
 
  directionalLight(255,255,255, 0, 01, -1);
  rotateX(-PI/15);
  pushMatrix();
  translate(300,300,00);
  ambientLight(64,155,255);
  ambient(64,105,255);
  //box(200,100,1000);
  rotateX(PI/2);
  ellipse(0,0,1000,1000);
  popMatrix();
  lights();
  
  float _r=map(300-ammo,0,300,0,255);
  float _g=map(ammo,0,300,0,255);
  pushMatrix();
  ambientLight(55,55,255);
  ambient(_r,_g,200);
  float playerX=map(mouseX,100,500,250,350);
  
  translate(playerX,240,480);
  
  box(10,10,10);
  ambient(0);
  float shadowX=map(playerX,200,400,-10,10);
  translate(shadowX,5,0);
  fill(0,100);
  box(10,0,10);
  
  popMatrix();
  
  
  
  
  
  
  if(mousePressed && ammo>0){
    PVector s=new PVector(playerX,240,480);
    bullets.add(s);
    ammo--;
  }
  

  
  
//rendering bullets
  for(int i=bullets.size()-1;i>0;i--){
    PVector s=bullets.get(i);
    pushMatrix();
    ambient(5,0,2550);
    fill(24, 40, 266,100);
    translate(s.x,s.y-1,s.z);
    sphere(2);
    ambient(0);
    translate(0,10,01);
    sphere(1);
    s.z-=10;
    bullets.set(i,s);
    if(s.z<200){
      bullets.remove(i);
      
    }
    popMatrix();
      
  for(int y=0;y<2;y++){
    for(int x=0;x<5;x++){
     PVector c=pos[y][x];
     //println(c.x,s.x);
     if(
       (c.x+10)>(s.x) &&
       (c.x-10)<(s.x) &&
       (c.z+10)>(s.z) &&
       (c.z-10)<(s.z)      
     ){
       pos[y][x]=new PVector(random(200,400),250,random(0,200));
       kills++;
     }
    }
  }
 
  }
  
 

  //rendering obstacles
  for(int y=0;y<2;y++){
    for(int x=0;x<5;x++){
     PVector c=pos[y][x];
     fill(255,255);
     //ambientLight(255,255,255);
     ambient(20,10,20);
     pushMatrix();
     translate(c.x,c.y,c.z);
     box(10);
     
     float shadowO=map(c.x,200,400,-10,10);
     translate(shadowO,5,0);
     ambient(0);
     fill(0,100);
     box(10,0,10);
     
     
     popMatrix();
     
     pos[y][x].z+=obstacleSpeed;
     
     
     if(pos[y][x].z>520){
       pos[y][x]=new PVector(random(200,400),240,random(0,200));
     }
       
       
     if(pos[y][x].z>475 && 
       pos[y][x].z<485  &&
       (c.x+5)>(playerX) &&
       (c.x-5)<(playerX) 
       ){
        
         crash=true;
         crashframe=0;
         if(lives==0)
             died=true;
         else{
           lives--;
         }
       }
    }
  }
  
  

}
