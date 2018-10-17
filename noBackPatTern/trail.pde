class Trail{

  ArrayList<PVector>p;
  int l;
  
  Trail(int n){
    l=n;
    p=new ArrayList<PVector>();
  }
  
  void add(PVector a){
    
    p.add(a);
    
    if(p.size()>l){
      p.remove(0);
      println(p.size());
    }
  
  }

}
