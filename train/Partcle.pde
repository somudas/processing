class Particle{
PVector acceleration,velocity,location;
float fade=255;
color rgb;
Particle(PVector l,color r){
location=l.get();
velocity=new PVector(random(-4,4),random(-1,1));
acceleration=new PVector(-0.7,-0.15);
rgb=r;
}

void update(){
velocity.add(acceleration);
location.add(velocity);
fade-=10;
}
boolean alive(){
if(fade>0){
return true;
}
else{
return false;
}

}
void show(){
stroke(255-fade,fade);
fill(255-fade,fade);
ellipse(location.x,location.y,20,20);
}

}