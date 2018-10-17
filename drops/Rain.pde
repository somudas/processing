class Rain{
    float x,y,z;
    float vel,acc;
    float f=255;
    Rain(float _x,float _y,float _z){
      x=_x;
      y=_y;
      z=_z;
      acc=0.1;
      vel=10;
      r=random(5);
    }
    void display(){
      //vel+=acc;
      z-=vel;
    
    }
    float a=205;
    float r;
    void ripple(){
      float dr=10;
      for(int i=1;i<=3;i++){
          dr+=i*5+r;
          stroke(f,a);
          stroke(166,166,255);
          drawEllipse(x,y,dr);
      }
      a=lerp(a,0,0.1);
      r=lerp(r,15,0.1);
    }
    
    void drawEllipse(float q, float w,float e){
      e/=2;
      
      for(float a=0;a<=TWO_PI;a+=0.1){
        float dis=map(noise(a),0,1,-5,5);
        float x=cos(a)*e+dis+q;
        float y=sin(a)*e+dis+w;
        
          point(x,y);
      }
        
    }
}
