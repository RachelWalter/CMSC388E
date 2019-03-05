Table table;
AsteroidSystem a;
PImage bg;
PImage earth;


void setup() {
  a = new AsteroidSystem();
  
  //image from https://www.vocfm.co.za/mysterious-repeating-radio-bursts-baffle-physicists/
  bg = loadImage("background.jpg"); 
  size(1240, 775);
  background(bg);
  
  // image from 
  earth = loadImage("planet.png");
  
  table = loadTable("fb_data.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()){
    a.processRow(row);
  }
}

void draw(){
  println("yay");
  pushMatrix();
  translate(width/2.2, height/2);
  image(earth, 0, 0, earth.width/25, earth.height/25); 
  popMatrix();
  noLoop();
}
