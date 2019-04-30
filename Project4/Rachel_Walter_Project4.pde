/* THIS IS THE ORIGINAL VERSION WITH ABSOLUTE VALUE RGB */
Table table;
int totalRows;
int counter;
ArrayList array;
int slowDown;

float maxX;
float maxY;
float maxZ;

// Macros for the gradient function 
int Y_AXIS = 1;
int X_AXIS = 2;

void setup() {
  table = loadTable("capture_example.csv", "header");
  size(640, 480);
  
  totalRows = table.getRowCount();
  print(totalRows + "\n");
  
  maxX = 0;
  maxY = 0;
  maxZ = 0;
  findMaxValues();
  
  counter = 0;
  
  array = new ArrayList<Integer>();
  array.add(255);
  
  slowDown = 0;
  preload();
}

void draw(){
    if(counter < totalRows && slowDown % 10 == 0){ //<>//
        TableRow row = table.getRow(counter);
        processRow(row);
        counter += 1;
        //print(counter + "\n");
    }
    slowDown++;
    
    for(int i = 0; i < array.size() - 1; i++){
      setGradient(0, i*12, width, 12.0 , (int)(array.get(i)), (int)(array.get(i+1)), Y_AXIS);
    }
    
    if(counter >= totalRows){
      counter = 0;
    }
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    table = loadTable(selection.getAbsolutePath(), "header");
  }
}

void processRow(TableRow row){
  float x = row.getFloat(0);
  float y = row.getFloat(1);
  float z = row.getFloat(2);
  /*float pitch = row.getFloat(3);
  float roll = row.getFloat(4);
  float yaw = row.getFloat(5);*/
 
  /* Original Hardcoded with Constants */
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
  
  color movement = color(red, green, blue);
  array.add(0, movement);
  
  if(array.size() > (height/12) + 1){
      array.remove(array.size() - 1);
  }
}

void preload(){
  for(int i = 0; i < (height/12)+1; i++){
    TableRow row = table.getRow(counter);
    processRow(row);
    counter += 1;
  }
  
  for(int i = 0; i < array.size() -1; i++){
      setGradient(0, i*12, width, 12.0 , (int)(array.get(i)), (int)(array.get(i+1)), Y_AXIS);
  }
}

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
