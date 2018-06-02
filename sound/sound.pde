import processing.sound.*;
SoundFile file;
Amplitude amp;
AudioIn in;
void setup(){
  size(600,600,P3D);
  background(0);
  file=new SoundFile(this,"C:\\Users\\Soumyadeep Das\\Downloads\\l.mp3");
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  //frameRate(25);
}
float np=10;
void draw(){
  background(5);
  float ht=map(noise(np),0,1,amp.analyze()*100,amp.analyze()*1000);
  strokeWeight(5);
  stroke(random(34),random(200),255);
  noFill();
  ellipse(300,300,210+ht/1.5,210+ht/1.5);
  fill(random(34),random(200),255);
  //fill(random(34),random(200),random(255));
  stroke(0);
  
  for(float x=200;x<400;x+=10){
    pushMatrix();
    float h=map(noise(np),0,1,amp.analyze()*1000,amp.analyze()*5000);
    pushMatrix();
    translate(300,300);
    noStroke();
    box(h*3,2,1);
    popMatrix();
    stroke(0);
    strokeWeight(1);
    translate(x+5,300);
    //rotateX(-0.25);
    box(10,h,10);
    popMatrix();
    np+=0.1;
  }
  np+=0.1;
}
