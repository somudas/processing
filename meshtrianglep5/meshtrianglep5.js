var n=15;
var points=[];
var speed =[];
var col =[];
var w, h;
var dim;

var sx=01;
var ax=0.06;

var happen=false;


function setup() {
  createCanvas(window.innerWidth, window.innerHeight);
  w=width;
  h=height;
  dim=w/9;
  smooth(105);
  
  background(250);
  for (var i=0; i<n; i++) {
    points[i]=createVector(random(w/2-dim, w/2+dim), random(h/2-dim, h/2+dim));
    speed[i]=createVector(random(-1, 1), random(-2, 1));
    col[i]=createVector(random(66), random(165), 255);
  }
}
var s=0;
function draw() {
  background(255,255);
  noStroke();

  for (var i=0; i<n; i++) {

    fill(col[i].x, col[i].y, col[i].z);

    beginShape(TRIANGLE_STRIP);
    for (var j=0; j<n; j++) {

      var d=dist( points[i].x, points[i].y, points[j].x, points[j].y);

      if (d<250) {      
        vertex( points[i].x, points[i].y );
        vertex(points[j].x, points[j].y);
      }
    }
    endShape(CLOSE);
    points[i].add(speed[i]);

    if (points[i].x<200 || points[i].x>400) {
      speed[i].x=-speed[i].x;
    }

    if (points[i].y<200 || points[i].y>400) {
      speed[i].y=-speed[i].y;
    }
    if(happen)
      points[i].x-=sx;
  }
  if(frameCount>20 && frameCount<100){
    happen=true;
    sx+=ax;
  }else{
    happen=false;
  }
  stroke(0);
  fill(0);
  textSize(80);
  textStyle(NORMAL);
  textFont('Helvetica');
  text('|  Unstable.', w/2-dim+(sx*20.5), h/2);
   
}
