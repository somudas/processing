import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;

int n=30;
float q=1,w=random(100),e=random(100);
float angle = 0;
Tree tree;
Tree [] trees=new Tree[n];
void setup() {
  size(600, 600, P3D);
  //slider = createSlider(0, TWO_PI, PI / 4, 0.01);
  //noLoop();
 
  for(int i=0;i<n;i++){
    trees[i]=new Tree(random(600),800,random(-1500,200),random(50,150));
  }
  
  
  
  file = new SoundFile(this, "C:\\Users\\Soumyadeep Das\\Downloads\\edms\\Killercats - Tell Me (feat.Alex Skrindo).mp3");
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw() {

  background(0,0,20);
   //glitch(1);
  rotateX(-PI/q);
  
  float ap=amp.analyze()*3000;
  for(int i=0;i<n;i++){
    trees[i].display();
    trees[i].z+=ap+10;
    
    if(trees[i].z>700){
      trees[i]=new Tree(random(-100,700),800,random(-1500,-500),random(50,150));
    }
  }
  if(frameCount>10){
    if(q<6)
      q+=0.1;
  }
}
void glitch(int n){
  if(frameCount%n==0)
    background(0,10,20);
}
