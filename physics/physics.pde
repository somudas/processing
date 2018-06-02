import shiffman.box2d.*; 
import org.jbox2d.collision.shapes.*; 
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Box> boxes;

void setup(){
  size(600,600);
  background(0);
  boxes = new ArrayList<Box>();
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  
}

void draw(){
  //background(0);
  
  box2d.step();
  
  
  fill(36,166,236);
  if(mousePressed){
    Box b=new Box(mouseX,mouseY);
    boxes.add(b);
  
  }
  
  
  for(int i=0;i<boxes.size();i++){
    Box b=boxes.get(i);
    b.display();
  
  }
}