class Box{
  
  Body body;
  
  
  float x;
  float y;
  
  
  Box(float xx,float yy){
  x=xx;
  y=yy;
  
  BodyDef bd = new BodyDef();
  bd.type = BodyType.DYNAMIC;
  bd.position.set(box2d.coordPixelsToWorld(x,y));
  
  body = box2d.createBody(bd);
  
  PolygonShape ps=new PolygonShape();
  float w=box2d.scalarPixelsToWorld(5);
  ps.setAsBox(w,w);
  
  FixtureDef fd=new FixtureDef();
  fd.shape=ps;
  fd.density=0.01;
  fd.friction=0.3;
  fd.restitution=0.5;
  
  body.createFixture(fd);
  

  }
  
  void display(){
    pushMatrix();
  Vec2 pos=box2d.getBodyPixelCoord(body);
  stroke(2);
  rectMode(CENTER);
  translate(pos.x,pos.y);
  float a=body.getAngle();
  rotate(a);
  //rect(x,y,10,10);
  rect(0,0,10,10);
  popMatrix();
  }

}