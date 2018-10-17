let cloudPs=[];
let n=7;

let gap=[];
let gapn=4;
let birdY=300,birdVel=1,birdAcc=0.1;

let gameOver=false;
let move=1;

let score=0;
function setup() {
    createCanvas(600,600);
    background(255);
    init();
    for(let i=0;i<n;i++){
        cloudPs[i]=createVector(random(800),random(400),random(3,7));
        
    }
    for(let i=0;i<gapn;i++){
        if(i==0)
            gap[i]=createVector(random(300,800),random(100,500));
        else
            gap[i]=createVector(gap[i-1].x+200,random(100,500));

        
    }

}

function init(){

     cloudPs=[];
     n=7;

     gap=[];
     gapn=4;
     birdY=300,birdVel=1,birdAcc=0.1;

     gameOver=false;
     move=1;

     score=0;
}

function draw() {

    
        background(66,134,255);
        //cloud
        drawClouds();
        //pillars
        drawPillars();
        

        if(birdY<650){
            birdY+=birdVel;
            birdVel+=birdAcc;
        }else{
            gameOver=true;
        }
        drawBird();
    if(gameOver){
        move=0;
        drawGameOver();

        
    }
    else{

        move=1;
        let width = findLength(score)*30;
        fill(50,200);
        rect(595-width,20,width,50);
        fill(255);
        rect(600-width,10,width,50);
        fill(20);
        stroke(20);
        strokeWeight(2);
        textAlign(RIGHT);
        textFont("Courier");
        textSize(50);
        text(score+"",600,50);
        score++;
        noStroke();
        birdCheck();
    }

}

function birdCheck(){
    for(let i=0;i<gapn;i++){
        let y=birdY;
        let x=200;
        let p=gap[i];
        
        if((y-30<=p.y && (p.x<=200 && p.x+30>=200) ) || (y+30>=p.y+100 && (p.x<=200 && p.x+30>=200))) {
            gameOver=true;        
            console.log(y-40,200);
            console.log(p.y,p.x,p.x+30);
            
            
        }
            
    }

}


function findLength(n){
    let a=0;
    for(let i=n;i|0>0;i/=10){
        a++;
    }
    return a+1;
}

function drawGameOver(){

    push();
    fill(255,200);
    rectMode(CENTER);
    rect(300,300,300,300);

    textAlign(CENTER);
    fill(20);
    textFont("Courier");
    stroke(20);
    strokeWeight(1);
    textSize(30);
    text("Your Score",300,220);
    strokeWeight(3);
    textSize(100);
    text(score+"",300,300);

    textSize(30);
    translate(0,80);
    let message="Game Over"
    text(message,300,280);
    textSize(20);
    strokeWeight(1);
    text("tap to play again",300,300);
    rectMode(CORNER);
    pop();

    if(mouseIsPressed){
        gameOver=false;
        score=0;
        setup();
    }

}

function pillarCheck(){
    for(let i=0;i<gapn-1;i++){
        let a=gap[i];
        let b=gap[i+1];
        let c=Math.abs(a.x-b.x);
        if(c<100)
            gap[i].x+=100;
    }
}

function mousePressed(){
    birdVel-=4;

}

function drawBird(){
    let y=birdY;
    noStroke();
    //body
    fill(255,200,15);
    ellipse(200,y,30,30);
    //head
    fill(255);
    ellipse(210,y-2,10,10);
    //eye
    fill(0);
    ellipse(212,y-2,4,4);

    
    
}

function drawClouds(){
    for(let i=0;i<n;i++){
        let cP=cloudPs[i];
        cloud(cP.z,cP.x,cP.y);
        cloudPs[i].x-=move/2;
        if(cloudPs[i].x<-50)
            cloudPs[i]=createVector(800,random(400),random(3,7));       
        }
}

function drawPillars(){
    for(let i=0;i<gapn;i++){
        pillar(gap[i].x,gap[i].y);
        gap[i].x-=move;
        if(gap[i].x<-50)
            gap[i]=createVector(random(600,800),random(100,500));
        
    }
    for(let i=0;i<gapn;i++){
        pillarCheck();
    }
}

function pillar(gx,gy){

    noStroke();
    fill(125, 201, 118);
    rect(gx,0,30,gy);
    rect(gx,gy+100,30,600-gy);


}


function cloud(size,x,y){
    fill(255);
    noStroke();
    ellipse(x,y,size*10,size*10);
    ellipse(x-(size*10)/2,y,size*10,size*10);
    ellipse(x+(size*10)/2,y,size*10,size*10);
    ellipse(x,y-(size*10)/2,size*10,size*10);   
}
