import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;



int n=1,n2=100;
PVector[][] rows=new PVector[n2][n];
PVector [][] cols=new PVector[n2][n];
void setup(){
  size(600,600,P3D);
  background(0);
  for(int y=0;y<n2;y++){
    for(int x=0;x<n;x++){
      rows[y][x]=new PVector(random(600),-y*100+500);
      cols[y][x]=new PVector(random(255),random(100),100);
    }
  }
  
  
  file = new SoundFile(this, "C:\\Users\\Soumyadeep Das\\Downloads\\edms\\Valence - Infinite.mp3");
  file.play();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);

}
float np=random(100);
float ymove=0;
void draw(){
  background(193, 89, 89);
  background(13,20,50);
  noStroke();
  if(ymove<450){
    ymove+=2;
  }
  float ap=amp.analyze()*1500;

  for(int y=0;y<n2;y++){
    for(int x=0;x<n;x++){
      PVector c=cols[y][x];
      PVector cV=rows[y][x];
      pushMatrix();
      translate(cV.x,ymove,cV.y);
      float a=map(noise(np),0,1,0,TWO_PI);
      rotate(a);
      
      fill(c.x,c.y,c.z);
      box(100,0,100);
      popMatrix();
      rows[y][x].y+=ap+20;
      
      if(rows[y][x].y>500){
        rows[y][x]=new PVector(random(600),-1700);
        
      }
      
    
    }
    np+=0.0001;
  }


}
