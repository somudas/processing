class Tree{
  float s;
  Tree(float a){
  s=a;
  }
  
  void display(){
    fill(250,150,80);
    box(s*5,s*50,s*5);
    translate(0,-s*33);
    fill(125,300,25);
    sphere(s*17);
    translate(s*17,0);
    sphere(s*17);
    translate(-s*33,0);
    sphere(s*17);
    translate(s*17,0,-s*17);
    sphere(s*17);
    translate(0,0,s*33);
    sphere(s*17);
    
  
  
  }

}
