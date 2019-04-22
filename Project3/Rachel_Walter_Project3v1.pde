/* Code based on  Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 16-11: Simple color tracking 
// Youtube: https://www.youtube.com/watch?v=nCVZHROb_dE&list=PLRqwX-V7Uu6bw0bVn4M63p8TMJf3OhGy8&index=5 */

import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor; 

// keeps track of whether we are tracking motion or not
boolean selected;

// keeps track of the last X/Y/brightness values 
// so we can see the change in motion
int prevX, prevY;
float prevBrightness;

// lets us track previous colors to make the whole screen pretty 
ArrayList array;

// Macros for the gradient function 
int Y_AXIS = 1;
int X_AXIS = 2;

/* SETUP */
void setup() {
  // set size of our screen
  size(640, 480);
  
  // prep video capturing
  video = new Capture(this, width, height);
  video.start();
  
  // Start off tracking for red arbitrarily 
  trackColor = color(255, 0, 0);
  prevX = 0;
  prevY = 0;
  
  // prep our array list 
  array = new ArrayList<Integer>();
  array.add(255);
  
  // fast framerate made me dizzy :( 
  frameRate(20);
}

/* HANDLE CAPTURING VIDEO */
void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}

/* mAIN DRAW FUNCTION */
void draw() {
  video.loadPixels();
  if(!selected){
    // display the video only when we aren't tracking a color
    image(video, 0, 0);
  }else{
    // Otherwise we're making art with movement! :)
    background(0);

    // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
    float worldRecord = 500; 
  
    // XY coordinate of closest color
    int closestX = 0;
    int closestY = 0;
    float pixelBrightness = 0;
  
    // Begin loop to walk through every pixel
    for (int x = 0; x < video.width; x ++ ) {
      for (int y = 0; y < video.height; y ++ ) {
        int loc = x + y*video.width;
        // What is current color?
        color currentColor = video.pixels[loc];
        float r1 = red(currentColor);
        float g1 = green(currentColor);
        float b1 = blue(currentColor);
        float r2 = red(trackColor);
        float g2 = green(trackColor);
        float b2 = blue(trackColor);
  
        // Using euclidean distance to compare colors
        float d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.
  
        // If current color is more similar to tracked color than
        // closest color, save current location and current difference
        if (d < worldRecord) {
          worldRecord = d;
          closestX = x;
          closestY = y;
          pixelBrightness = brightness(video.pixels[loc]);
        }
      }
    }
    
    // Convert the X,Y,Z to R,G,B values based on rate of change 
    float red = Math.abs(closestX - prevX)*1.5; // left right movement
    float green = Math.abs(closestY - prevY)*1.5; // up down movement 
    float blue = Math.abs(pixelBrightness - prevBrightness)*50; //brightness
    
    // the new color is made up with those RGB 
    color movement = color(red, green, blue);
    
    // Had a lot of black on the screen,
    // to fight this we check that the change is enough to display a color
    // Add to the array so we can make a full screen art piece
    if(red > 20 || green > 20 || blue > 20){
      array.add(0, movement);
    }else{
      array.add(array.get(0));
    }
    
    // Our screen is only so big! Use FIFO to remove old color values 
    if(array.size() > (height/12)){
      array.remove(array.size() - 1);
    }
   
    for(int i = 0; i < array.size() - 1; i++){
      setGradient(0, i*12, width, 12.0 , (int)(array.get(i)), (int)(array.get(i+1)), Y_AXIS);
    }
    
    // Display the color/location of the thing you're tracking (mostly for debugging 
    // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
    if (worldRecord < 10) { 
      // Draw a circle at the tracked pixel
      fill(trackColor);
      strokeWeight(4.0);
      stroke(0);
      ellipse(closestX, closestY, 16, 16); 
    }
    
    // Store values so we can compare on the next capture 
    prevX = closestX;
    prevY = closestY;
    prevBrightness = pixelBrightness; 
 }
}

/* SELECT THE COLOR TO TRACK */
void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
  prevX = mouseX;
  prevY = mouseY;
  prevBrightness = brightness(video.pixels[loc]);
  selected = true;
}

/* USER CONTROLS
/* Enter/Return: Take screenshot
/* Esc: Stop Tracking */
void keyPressed() {
  if(key == TAB){
    selected = false;
  }
  
  if(key == ENTER || key == RETURN){
    saveFrame("" + month() + "_" + day() + "_" + hour() + "_" + minute() + ".png");
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
