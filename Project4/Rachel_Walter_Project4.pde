/* THIS IS THE ORIGINAL VERSION WITH ABSOLUTE VALUE RGB */
// Used to store/access CSV values
Table table;

// Stores the number of rows in the table so that we don't go out of bounds
int totalRows;

// Tracks which row of data we are on
int counter;

// Stores the colors currently on the screen
ArrayList array;

// Addiotional counter which controls how fast data is processed
int slowDown;

// Stores largest (absolute) X, Y, and Z values so we can map the range of movement into RGB
float maxX;
float maxY;
float maxZ;

// Macros for the gradient function 
int Y_AXIS = 1;
int X_AXIS = 2;

/* SETUP: PREPARE THE PROGRAM TO RUN */
void setup() {
  // Choose file, sadly this is hardcoded right now 
  table = loadTable("inmyfeelings.csv", "header");
  
  // set the size of the piece, this was chosen semi-arbitrarily 
  size(640, 480);
  
  // Store # of rows
  totalRows = table.getRowCount();
  print(totalRows + "\n");
  
  // Find the maximum (absolute) values
  maxX = 0;
  maxY = 0;
  maxZ = 0;
  findMaxValues();
  
  // Start at row 0 in the table
  counter = 0;
  // slowDown init'd to 0 as well
  slowDown = 0;
  
  // Prepare the color array 
  array = new ArrayList<Integer>();
  array.add(255);
  
  // this function preloads the first few rows so that we don't 
  // start with a sad grey screen
  preload();
}

/* DRAW: LET'S SEE THE ART */
void draw(){
    // Choose to process data based on location in table and data slow down
    // From experimentation, %2 makes the data match up better with the time within 
    // the capture, but it can seem a little fast so it may be changed 
    if(counter < totalRows && slowDown % 2 == 0){ //<>//
        // access the row we are on 
        TableRow row = table.getRow(counter);
        // process the row to add to the color array
        processRow(row);
        // increment our row counter
        counter += 1;
        //print(counter + "\n");
    }
    // we always increment our slowDown factor
    slowDown++;
    
   // Draw the gradients onto the screen  //<>//
   for(int i = 0; i < array.size() - 1; i++){
      setGradient(0, i*12, width, 12.0 , (int)(array.get(i)), (int)(array.get(i+1)), Y_AXIS);
    }
    
    if(counter >= totalRows){
      counter = 0;
    }
}

/* This was copied from the Processing website for choosing files,
   but it didn't work on my system (Mac OSX)
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    table = loadTable(selection.getAbsolutePath(), "header");
  }
} */

/* PROCESS ROW: Get data from the table row and add it to our data structures */
void processRow(TableRow row){
  // get x, y, and z values
  float x = row.getFloat(0);
  float y = row.getFloat(1);
  float z = row.getFloat(2);
  // also measured gyroscope values in case they were needed 
  /*float pitch = row.getFloat(3);
  float roll = row.getFloat(4);
  float yaw = row.getFloat(5);*/
 
  /* Originally Hardcoded with Constants */
  /*float red = Math.abs(x)*127 % 255; 
  float green = Math.abs(y)*50 % 255; 
  float blue = Math.abs(z)*127 % 255;*/
  
  /*Make use of max values to better fit the range */
  float red = Math.abs(x)*(255/maxX) % 255;
  float green = Math.abs(y)*(255/maxY) % 255; 
  float blue = Math.abs(z)*(255/maxZ) % 255; 
  
  /* THIS VERSION USED RGB WITH 0 = 127.5 */
  /* float red = x * (127.5/maxX) + 127.5;
  float green = y * (127.5/maxY) + 127.5;
  float blue = z * (127.5/maxZ) + 127.5; */
  
  // add the new color to the array
  color movement = color(red, green, blue);
  array.add(0, movement);
  
  // if we outgrow the size of our screen, remove a color
  if(array.size() > (height/12) + 1){
      array.remove(array.size() - 1);
  }
}

/* PRELOAD: do some initial row processing 
/* so we have a color start screen instead of grey */
void preload(){
  // Process first few rows based on screen height
  for(int i = 0; i < (height/12)+1; i++){
    TableRow row = table.getRow(counter);
    processRow(row);
    counter += 1;
  }
  
  // Draw to the screen
  for(int i = 0; i < array.size() -1; i++){
      setGradient(0, i*12, width, 12.0 , (int)(array.get(i)), (int)(array.get(i+1)), Y_AXIS);
  }
}

/* FIND MAX VALUES: finds max (absolute) X, Y, and Z values so we can map them 
/* to a range of 0 through 255 accurately */
void findMaxValues(){
  for(int i = 0; i < table.getRowCount(); i ++){
    TableRow row = table.getRow(i);
    float x = row.getFloat(0);
    float y = row.getFloat(1);
    float z = row.getFloat(2);
    /*float pitch = row.getFloat(3);
    float roll = row.getFloat(4);
    float yaw = row.getFloat(5);*/
    
    if(Math.abs(x) > maxX){
      maxX = Math.abs(x);
    }
    if(Math.abs(y) > maxY){
      maxY = Math.abs(y);
    }
    if(Math.abs(z) > maxZ){
      maxZ = Math.abs(z);
    }
    
  }
}

/* MAKE A GRADIENT WITH 2 COLORS AND X/Y PLACEMENT 
/* Taken from: https://processing.org/examples/lineargradient.html */
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
