import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;

int n=(int)(TWO_PI/0.1);
PImage cover,a,b;

PImage pause,rewind,forward;


PVector[]pos=new PVector[n];
PVector[]tar=new PVector[n];
String start="OneRepublic - Start Again ft. Logic.mp3";
String to="Twenty_One_Pilots_-_My_Blood_makhits.com.mp3";
String t="Twenty_One_Pilots_-_My_Blood";
String ncs="The Dazers - Debris & Dazers - Double D.mp3";
String nc="The Dazers - Debris & Dazers - Double D";
PFont font;
float da=0;
int remaining, elapsed;


void setup() {
  size(600, 600, P3D);
  cover=loadImage("21.jpg");
  
  pause=loadImage("pause.png");
  rewind=loadImage("rewind.png");
  forward=loadImage("forward.png");
  
  a=loadImage("ncs.jpg");
  b=loadImage("cor.jpg");
  
  
  String[] fontList = PFont.list();
  printArray(fontList);
  font=createFont("IMPACT", 20);
  for (float i=0, a=0; i<n; i++, a+=0.1) {
    int no=(int)i;
    float x=cos(a)*100+300;
    float y=sin(a)*100+300;
    pos[no]=new PVector(x, y);
    tar[no]=new PVector(random(600), random(y));
  }
  file = new SoundFile(this, "C:\\Users\\SoumyadeepDas\\Downloads\\"+ncs);
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  remaining=(int)(file.duration());
  elapsed=0;
}
void draw() {
  background(0,0,0);

  pushMatrix();

  translate(0, 400);
  rotateX(PI/2);
  translate(0, -300);

  noStroke();

  float loud=amp.analyze()*10000;
  fill(255);
  for (float x=180; x<430; x+=3) {
    float y=sin(da)*10+350;
   
    pushMatrix();
    translate(x, y, 0);
    box(1, 1, random(loud/20));
    popMatrix();
    da+=0.1;
  }
  popMatrix();
  fill(255);
  stroke(255);
  drawCover( a,cover, b);

  //title
  textAlign(CENTER);
  textSize(30);
  text(nc, 300, 30);


  translate(0, -100);
  textSize(20);
  textFont(font);
  text(format(remaining), 500, 600);
  text(format(elapsed), 100, 600);
  strokeWeight(1);
  line(500, 575, 100, 575);
  strokeWeight(3);
  line(100, 575, 100+frameCount/60, 575);
  ellipse(100+frameCount/60, 575, 5, 5);
  
  noFill();
  strokeWeight(1);
  ellipse(300,660,60,60);
  image(pause,300,660,50,50);
  
  image(rewind,230,660,50,50);
  image(forward,370,660,50,50);
  
  if (remaining>=0) {
    if (frameCount%60==0) {
      elapsed++;
      remaining--;
    }
  }
}

void drawCover(PImage a, PImage b, PImage c) {
  imageMode(CENTER);
  translate(0, 0, -100);
  image(a, 300, 200, 300, 300);
  pushMatrix();
  translate(300, 00, -100);
  rotateY(-PI/10);
  translate(-300, 00);
  image(b, 500, 200, 200, 200);
  popMatrix();
  pushMatrix();
  translate(0, 0, -100);
  rotateY(PI/10);
  image(c, 100, 200, 200, 200);
  popMatrix();
}
String format(int sec) {
  String str="";

  int min=sec/60;
  int s=sec%60;
  str=min+":"+s;

  return str;
}
