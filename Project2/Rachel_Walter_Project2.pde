/* Solar System Tutorial: https://www.youtube.com/watch?v=l8SiJ-RmeHU */

Table table;
AsteroidSystem as;
PImage bg;
PImage earth;
int counter;
int rowCount;
int slowDown;

PImage a1, a2, a3, a4, a5, a6;

void setup() {
  as = new AsteroidSystem();
  
  /* ASTEROID IMAGES */
  a1 = loadImage("asteroid1.png");
  a2 = loadImage("asteroid2.png");
  a3 = loadImage("asteroid3.png");
  a4 = loadImage("asteroid1.png");
  a5 = loadImage("asteroid1.png");
  a6 = loadImage("asteroid1.png");
  
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
  if(counter < rowCount && slowDown % 100 == 0){
    TableRow row = table.getRow(counter);
    as.processRow(row);
    counter += 1;
  }
  slowDown++;
  
  background(bg);
  
  pushMatrix();
  translate((width/2)-50, (height/2)-50);
  image(earth, 0, 0); //, earth.width/25, earth.height/25
  translate(50, 50);
  as.update();
  popMatrix();
}
