class Trail{
  
  ArrayList<PVector> list;
  int n;
  Trail(int _n){
    n=_n;
    list=new ArrayList<PVector>();
  }
  
  void show(PVector a){
   list.add(a);
   for(PVector b: list){
     pushMatrix();
     translate(b.x,b.y);
     rect(0,0,10,10);
     popMatrix();
   }
    
  }

}
