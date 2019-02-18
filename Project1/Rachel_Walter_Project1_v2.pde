/* global variables */
float x, y; // this will be our origin points
float translateX, translateY;
int opacity;
float degree;
int flag;

void setup(){
  /* Here I am going to initialize our "canvas" to be the right color and size*/
  fullScreen();
  background(247, 247, 242);
  
  /* Here I set the color and opacity of the footprints */
  opacity = 200;
  stroke(0);
  fill(0);
  
  /* Here I set up the inital location for the feet and the degree it starts at */
  x = width/2;
  y = height/2;
  translateX = 0;
  translateY = 0;
  degree = 0;
  flag = 0;
  
  frameRate(1);
}

void draw(){
  // choose x vector magnitude and direction
  float deltaX = random(40,60);
  float positiveOrNegative = random(-1,1);
  if(positiveOrNegative < 0){
    deltaX *= -1;
  }
  
  // choose y vector magnitude and direction
  float deltaY = random(40,60);
  positiveOrNegative = random(-1,1);
  if(positiveOrNegative < 0){
    deltaY *= -1;
  }
  
   
  if(deltaX < 0 && deltaY < 0){ // up and to the left
    degree = (PI/2.0) - atan(deltaY/deltaX);
    flag = 1;
  }else if(deltaX > 0 && deltaY < 0){ // up and to the right
    degree = ((PI/2.0) - atan(deltaY/(deltaX*-1)))*-1;
    flag = 2;
  }else if(deltaX > 0 && deltaY > 0){ // down and to the right
    degree = (PI/2.0) + atan((-1*deltaY)/deltaX);
    flag = 3;
  }else{// down and to the left
    degree = ((PI/2.0) + atan(deltaY/deltaX))*-1;
    flag = 4; 
  }
    
  
  feet();
  
  translateX += deltaX;
  translateY += deltaY;
  
  opacity -= 5;
  if(opacity == 0){
    opacity = 200;
  }
  
  fill(0,0,0, opacity); 
  stroke(0,0,0,opacity);
  
}

void feet(){
  /* This sets up the rotation and movement of the feet */
  translate(translateX, translateY);
  pushMatrix();
  //rotate(degree);
    
   /* Drawing the right footprint */
  ellipse(x,y,10,10); // ball of the foot
  ellipse(x+3, y+15, 5, 20); // arch and back of foot
  ellipse(x-5,y-7,3,3); // big toe
  ellipse(x,y-7,3,3); // middle toe
  ellipse(x+4,y-7,2,2); // third toe
  
  /* Drawing the left footprint */
  float leftx = x-30; //offset so it looks like the foot prints are walking (one stride is in front of another)
  float lefty = y-30;
  ellipse(leftx,lefty,10,10); // ball of the foot
  ellipse(leftx-3, lefty+15, 5, 20); // arch and back of foot
  ellipse(leftx+5,lefty-7,3,3); // big toe
  ellipse(leftx,lefty-7,3,3); // middle toe
  ellipse(leftx-4,lefty-7,2,2); // third toe
  
  popMatrix();
}
