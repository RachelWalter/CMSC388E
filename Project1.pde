int opacity; 
float x;
float y;
float rotation;

void setup(){
  //size(700,700);
  x = random(0, 700); // initialize the starting x coordinate of the footprint
  y = random(0, 700); // initialize the starting y coordinate of the footprint
  opacity = 200;
  fullScreen();
  background(250, 242, 217);
  stroke(0);
  fill(0);
  rotation = 0;
  frameRate(5);
}

void draw(){
  rotate(rotation);
  
  /* Drawing the right footprint */
  ellipse(x,y,10,10); // ball of the foot
  ellipse(x+3, y+15, 5, 20); // arch and back of foot
  ellipse(x-5,y-7,3,3); // big toe
  ellipse(x,y-7,3,3); // middle toe
  ellipse(x+4,y-7,2,2); // third toe
  
  /* Drawing the left footprint */
  float leftx = x-30; //offset so it looks like the foot prints are walking
  float lefty = y-30;
  ellipse(leftx,lefty,10,10); // ball of the foot
  ellipse(leftx-3, lefty+15, 5, 20); // arch and back of foot
  ellipse(leftx+5,lefty-7,3,3); // big toe
  ellipse(leftx,lefty-7,3,3); // middle toe
  ellipse(leftx-4,lefty-7,2,2); // third toe
  
  opacity -= 1; // opacity weaks at each iteration because "paint" is coming off the feet
  if(opacity <= 0){
    opacity = 200; // but we can always dip our feet in more paint
  }
  fill(0,0,0, opacity); 
  stroke(0,0,0,opacity);
  float saveOld = rotation; //<>//
  
  do{
    float angle = random(0,TWO_PI);
    float nextPlace = (angle + saveOld) % TWO_PI;
    
    if(nextPlace >= 0 && nextPlace < (PI/2)){ // move to bottom right
      y += random(10,20);
      x += random(10,20);
      //rotate(nextPlace);
    }else if(nextPlace < TWO_PI && nextPlace >= (3*PI/2.0)){ // move to top right
      y -= random(10,20);
      x += random(10,20);
      //rotate(nextPlace);
    }else if(nextPlace >= PI && nextPlace < (3*PI/2.0)){ // move to top left
      y -= random(10,20);
      x -= random(10,20);
      //rotate(nextPlace);
    }else{ // move to bottom left
      y += random(10,20);
      x -= random(10,20);
      //rotate(nextPlace);
    } 
    
    rotation = nextPlace;
  }while(x > width || y > height || x < 0 || y < 0);
}
