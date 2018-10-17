let img;
function preload(){
  //img=loadImage('libraries\news.jpg');
}
function setup() {
  createCanvas(600, 600, WEBGL);
  background(0);
  
}
let a=0;
function draw() {
  background(0);
  let x=map(cos(i),-1,1,100,500);
  let y=map(sin(i),-1,1,100,-500);
  camera(0, 0, sin(frameCount * 0.01) * 100, 0, 0, 0, 0, 1, 0);
  translate(0, 0, 0);
  pointLight(random(150), random(100), 0, 500, 0, 200);
  for (let i=0; i<6.28; i+=0.1) {
    push();
    let x=map(cos(i),-1,1,100,500);
    let y=map(sin(i),-1,1,100,-500);
    
    //texture(img);
    translate(x-300,0,y+300);
    //rotateZ(frameCount * 0.01);
    //rotateX(frameCount * 0.01);
    //rotateY(frameCount * 0.01);
    torus(70, 20);
    pop();
  }
  a+=0.1;
}
