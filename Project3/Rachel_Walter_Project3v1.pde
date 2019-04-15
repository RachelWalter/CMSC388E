// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 16-11: Simple color tracking

import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor; 

boolean selected;
int prevX, prevY;
float prevBrightness;

ArrayList array;

int Y_AXIS = 1;
int X_AXIS = 2;

void setup() {
  size(640, 480);
  video = new Capture(this, width, height);
  video.start();
  // Start off tracking for red
  trackColor = color(255, 0, 0);
  prevX = 0;
  prevY = 0;
  array = new ArrayList<Integer>();
  array.add(255);
  frameRate(20);
}

void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}

void draw() {
  video.loadPixels();
  if(!selected){
    image(video, 0, 0);
  }else{
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
        // What is current color
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
  
    /* We only consider the color found if its color distance is less than 10. 
    // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
    if (worldRecord < 10) { 
      // Draw a circle at the tracked pixel
      fill(trackColor);
      strokeWeight(4.0);
      stroke(0);
      ellipse(closestX, closestY, 16, 16); 
    }*/
    
    float red = Math.abs(closestX - prevX);
    float green = Math.abs(closestY - prevY);
    float blue = Math.abs(pixelBrightness - prevBrightness)*50;
    
    color movement = color(red, green, blue);
    array.add(0, movement);
    if(array.size() > (height/12)){
      array.remove(array.size() - 1);
    }
   
    for(int i = 0; i < array.size() - 1; i++){
      setGradient(0, i*12, width, 12.0 , (int)(array.get(i)), (int)(array.get(i+1)), Y_AXIS);
    }
    
    prevX = closestX;
    prevY = closestY;
    prevBrightness = pixelBrightness; 
 }
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
  prevX = mouseX;
  prevY = mouseY;
  prevBrightness = brightness(video.pixels[loc]);
  selected = true;
}

void keyPressed() {
  if(key == ENTER || key == RETURN){
    selected = false;
  }
}

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
