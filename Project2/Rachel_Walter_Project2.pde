/* Solar System Tutorial: https://www.youtube.com/watch?v=l8SiJ-RmeHU */

Table table; // this the table of CSV data
AsteroidSystem as; // this is my ateroid system, like the particle system
PImage bg; // background image
PImage earth; // this is the central earth
int counter; // this keeps track of the row of the table we're on
int rowCount; // stores the max number of rows in the table
int slowDown; // makes it so all the months do not happen at once

// initializing all of our asteroid images for an organic feel
PImage a1, a2, a3, a4, a5, a6, a7, a8;

void setup() {
  // creating our asteroid system
  as = new AsteroidSystem();
  
  /* ASTEROID IMAGES */
  a1 = loadImage("asteroid1.png");
  a2 = loadImage("asteroid2.png");
  a3 = loadImage("asteroid3.png");
  a4 = loadImage("asteroid4.png");
  a5 = loadImage("asteroid5.png");
  a6 = loadImage("asteroid6.png");
  a7 = loadImage("asteroid7.png");
  a8 = loadImage("asteroid8.png");
  
  //image from https://www.vocfm.co.za/mysterious-repeating-radio-bursts-baffle-physicists/
  bg = loadImage("background2.jpg"); 
  //size(1240, 775); bg 1
  size(1366,768);
  background(bg);
  
  // image from 
  earth = loadImage("planet.png");
  earth.resize(100,100); 
  
  table = loadTable("fb_data.csv", "header");

  rowCount = table.getRowCount();
  counter = 0;
  frameRate(10);
}

void draw(){
  // Process new data if we have more data and had a waiting period
  if(counter < rowCount && slowDown % 100 == 0){
    TableRow row = table.getRow(counter);
    as.processRow(row);
    counter += 1;
  }
  slowDown++;
  
  // load the background (stops us from having ghost asteroids?)
  background(bg);
  
  // translate the matrix so that 0,0 is at the center of the Earth
  pushMatrix();
  translate((width/2)-50, (height/2)-50);
  image(earth, 0, 0); // show the Earth!
  translate(50, 50);  // update origin again for the asteroids
  as.update(); // update all the asteroids!
  popMatrix();
}
