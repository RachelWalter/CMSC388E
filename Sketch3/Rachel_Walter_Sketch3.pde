/* MY RESOURCES FOR THIS PROJECT:
/* Cell Tutorial: https://natureofcode.com/book/chapter-7-cellular-automata/ */
/* Tutorial Video: https://www.youtube.com/watch?v=W1zKu3fDQR8&t=752s */
/* Associated GitHub repo: https://github.com/nature-of-code/noc-examples-processing/tree/master/chp07_CA*/

/* To make my project unique, I added more random generation (both to making rulesets and the initial states of cells.
/* I also slowed the generation to make it slower and easier to view the scrolling and changed the color pallette of the piece */

/* MY MESSAGE: I wanted to show the restoring affect of nature through this piece. I noticed when playing around with 
/* the cell automata rulsets, the designs often reminded me of rocky trails I had gone hiking on or patterns I've 
/* seen on shells, leaves, etc. The scrolling affect was also very peaceful, like walking through one of those hikes.
/* I wanted the viewer to feel the same restoration and renewal I feel through being in nature. 
/* To enhance this I added more randomness which is the chaoitic parts of our lives that can be soothed by engaging with nature. 
/* I also used earthy tones instead of black and white to add to the natural feeling of the piece. */ 

/* CHANGES MADE FOR ITERATIVE SKETCH:
   1. Made color scheme green + brown to match theme of nature
   2. Updated so that colors flow nicely without a break in the gradient
   3. Added generations to the instantiation so that there is less of a QR Code feel */

CellAutomata CA;

/* SET UP THE SCREEN AND INIT OUR CA */
void setup(){
  // set the size of the screen
  size(800,800);
  // frame rate slow otherwise I get dizzy
  frameRate(20);
  // gives us a clean slate
  background(255);
  
  //set our color mode for the piece to HSB
   colorMode(HSB, 360, 100, 100);
  
  // instantiate our cell automata with a random set of rules
  CA = new CellAutomata(randomRules());
}

/* DRAWING AND GENERATING CELLS */
void draw(){
  // clean slate each time
  background(32,30,41);
  // draw our cells
  CA.drawCells();
  // define the next generation 
  CA.generate();
}

/* ALLOWS YOU TO RESTART THE GENERATION */
void mousePressed() {
  background(32,30,41);
  CA = new CellAutomata(randomRules());
}

/* GENERATES A NEW SET OF RULES */
int[] randomRules(){
  int ruleset[] = new int[8];
  for(int i = 0; i < 8; i++){
    ruleset[i] = (int)(random(0,2));
  }
  
  return ruleset;
}
