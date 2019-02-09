/* Global Variables */
int opacity;  //how dark are the paint footprints?
float x; // x coordinate of the center of the first foot being drawn
float y; // y coordinate of the center of the first foot being drawn
float direction; // determines where the artist is moving first
int count = 0; // determines how the artist is getting there (left, right, down, or up)

void setup(){
  /* This section will initialize variables that will help me mimic the artist walking across the canvas. */
  x = random(0, 700); // initialize the starting x coordinate of the footprint
  y = random(0, 700); // initialize the starting y coordinate of the footprint
  
  opacity = 200; // sets the opacity high to start out, the feet have fresh paint on them
  
  direction = 0; // As the figure moves, the foot prints will change direction to depict the act of walking
  
  /* This section sets up the screen to my liking
  * This includes the color of the background, the size, and the stroke  color*/
  fullScreen();
  background(250, 242, 217);
  stroke(0);
  fill(0);
  
  /* This line was mainly used for me to watch the progress at different speeds */
  frameRate(5);
}

void draw(){
  /* The artist chooses a direction to walk and moves in that direction, searching for her purpose and inspiration */
  /* An even count means pointing up or down. An odd count means pointing left or right */
  if(direction >= 0 && direction < 1){
      // This direction means that the print will go up and to the right
      if(count % 2 == 0){
        drawFeetUp();
      }else{
        drawFeetRight();
      }
    }else if(direction >= 1 && direction < 2){
      // This direction means that the print will go up and to the left
       if(count % 2 == 0){
        drawFeetUp();
      }else{
        drawFeetLeft();
      }
    }else if(direction >= 2 && direction < 3){
      // This direction means that the print will go down and to the left
       if(count % 2 == 0){
        drawFeetDown();
      }else{
        drawFeetLeft();
      }
    }else{
      // This direction means that the print will go down and to the right
      if(count % 2 == 0){
        drawFeetDown();
      }else{
        drawFeetRight();
      }
    }  
  
  /* We update the opacity for the next steps that are taken */
  opacity -= 5; // opacity weaks at each iteration because "paint" is coming off the feet
  if(opacity <= 0){
    opacity = 200; // but we can always dip our feet in more paint :)
  }
  fill(0,0,0, opacity); 
  stroke(0,0,0,opacity);
  
  /* Update the counter for the next iteration */
  count+= 1;
  
  /* These values are saved so that if the random generation takes us off the canvas, we can choose a new value and direction correctly */
  float saveX = x;
  float saveY = y;
  
  /* This selects the next region to walk to. It repeats so the artist doesn't walk off the canvas into the abyss */
  do{
    x = saveX;
    y = saveY;
    direction = random(0,4); //<>//
    
    if(direction >= 0 && direction < 1){
      // This direction means that the print will go up and to the right
      x+= random(40,60);
      y-= random(40,60);
    }else if(direction >= 1 && direction < 2){
      // This direction means that the print will go up and to the left
       x-= random(40,60);
       y-= random(40,60);
    }else if(direction >= 2 && direction < 3){
      // This direction means that the print will go down and to the left
       x-= random(40,60);
       y+= random(40,60);
    }else{
      // This direction means that the print will go down and to the right
       x+= random(40,60);
       y+= random(40,60);
    }  
  }while(x > width || y > height || x < 0 || y < 0);
}

/* The feet drawn facing so it looks like it is going towards the top of the screen */
void drawFeetUp(){
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
}

/* The feet drawn facing so it looks like it is going towards the bottom of the screen */
void drawFeetDown(){
  /* Drawing the right footprint */
  ellipse(x,y,10,10); // ball of the foot
  ellipse(x-3, y-15, 5, 20); // arch and back of foot
  ellipse(x+5,y+7,3,3); // big toe
  ellipse(x,y+7,3,3); // middle toe
  ellipse(x-4,y+7,2,2); // third toe
  
  /* Drawing the left footprint */
  float leftx = x+30; //offset so it looks like the foot prints are walking
  float lefty = y+30;
  ellipse(leftx,lefty,10,10); // ball of the foot
  ellipse(leftx+3, lefty-15, 5, 20); // arch and back of foot
  ellipse(leftx-5,lefty+7,3,3); // big toe
  ellipse(leftx,lefty+7,3,3); // middle toe
  ellipse(leftx+5,lefty+7,2,2); // third toe
}

/* The feet drawn facing so it looks like it is going towards the left of the screen */
void drawFeetLeft(){
  /* Drawing the right footprint */
  ellipse(x,y,10,10); // ball of the foot
  ellipse(x+15, y-3, 20, 5); // arch and back of foot
  ellipse(x-7,y+5,3,3); // big toe
  ellipse(x-7,y,3,3); // middle toe
  ellipse(x-7,y-4.5,2,2); // third toe
  
  
  /* Drawing the left footprint */
  float leftx = x-30; //offset so it looks like the foot prints are walking
  float lefty = y+30;
  ellipse(leftx,lefty,10,10); // ball of the foot
  ellipse(leftx+15, lefty+3, 20, 5); // arch and back of foot
  ellipse(leftx-7,lefty-5,3,3); // big toe
  ellipse(leftx-7,lefty,3,3); // middle toe
  ellipse(leftx-7,lefty+5,2,2); // third toe
}

/* The feet drawn facing so it looks like it is going towards the right of the screen */
void drawFeetRight(){
    /* Drawing the left footprint */
  ellipse(x,y,10,10); // ball of the foot
  ellipse(x-15, y-3, 20, 5); // arch and back of foot
  ellipse(x+7,y-5,3,3); // big toe
  ellipse(x+7,y,3,3); // middle toe
  ellipse(x+7,y+4.5,2,2); // third toe
  
  
  /* Drawing the right footprint */
  float leftx = x-30; //offset so it looks like the foot prints are walking
  float lefty = y+30;
  ellipse(leftx,lefty,10,10); // ball of the foot
  ellipse(leftx-15, lefty+3, 20, 5); // arch and back of foot
  ellipse(leftx+7,lefty-5,3,3); // big toe
  ellipse(leftx+7,lefty,3,3); // middle toe
  ellipse(leftx+7,lefty+5,2,2); // third toe
}
