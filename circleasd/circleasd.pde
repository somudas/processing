
import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;
PImage img;

void setup() {

  size(600, 600, P3D);
  background(0);
  img=loadImage("C:\\Users\\SoumyadeepDas\\Pictures\\dfg.jpg");
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\Unknown Brain - Perfect 10 (ft. Heather Sommer).mp3");
  file.play();
  nr=random(1000);
  ng=random(1000);
  nb=random(1000);



  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
float cx=260, cy=200;
float a=0;
float s=0;
float x=300-40;
float nr,ng,nb;
float r,g,b;
float i;
void draw() {
  background(0);
  stroke(66, 155, 255, 25);
  float am=amp.analyze()*10;
   i=map(noise(s), 0, 1, 0, 50);
  float rot=map(noise(s), 0, 1, -PI, PI);
  translate(300, 300);
  x=0;
  //rotate(rot);
  // for(float i=50;i<200;i++){
  //for(float c=0;c<2;c+=0.1){
  //  float sx=sin(c)*50;
  //  float sy=log(c)*50;

  //  strokeWeight((1+sin(x+a))*i);
  //  point(sx,sy);
  //  x+=0.2;
  //}
  //translate(200,0);
  float ui=0;
  for (int w=2; w<7; w++) {
    setColor();
    stroke(r,g,b,i+10);
    rotate(ui);
    ui+=0.1;
    for (float c=0; c<TWO_PI; c+=0.1) {
      float sx=sin(c)*w*20;
      float sy=cos(c)*w*20;
      texture(img);
      float siz=(1+sin(x+sy+a))*i;
      strokeWeight(siz);
      point(sx, sy);
      x+=0.2;
    }
    
    nr+=i*2;
    ng+=i*2;
    nb+=i*2;
  }



  //}
  //point(cx,cy);
  a+=0.1;
  s+=am;
  
}
void createEllipse(float x, float y, float s) {
  beginShape();

  pushMatrix();
  translate(x, y);
  for (float q=0; q<TWO_PI; q+=0.1) {
    texture(img);
    float bx=cos(q)*s;
    float by=sin(q)*s;
    vertex(bx, by);
  }
  popMatrix();
  endShape();
  
}
float cr=55,cg=255,cb=155;
void setColor(){
  
  if(i<20){
    cr=random(55,255);
    cg=random(55,255);
    cb=random(55,255);
    
  }
  
 
  r=map(noise(nr),0,1,0,cr);
  g=map(noise(ng),0,1,0,cg);
  b=map(noise(nb),0,1,0,cb);
  

}
