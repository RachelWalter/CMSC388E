class CellAutomata{
  // this array is used to hold the state of each possible cell in the lineup
  int cells[][];
  // this is the array of our generation rules
  int ruleset[];
  // used to define the size of the cells on screen
  int w;
  //track the num of rows/cols in the matrix
  int cols, rows;
  //used to track the generation we are on
  int generation;
  
  /* CONSTRUCTOR */
  CellAutomata(int[] r){
    // each cell will be a 10 pixel square
    w = 10;
    
    // set the number of rows/cols based on the width/height
    cols = width/w;
    rows = height/w;
    
    // set generation to 0
    generation = 0;
    
    // make our ruleset the one from the parameter
    ruleset = r;
    
    // make the array of cells take up the whole width of the screen
    cells = new int[cols][rows];
    
    // initialize the first generation of cells
    for(int i = 0; i < cols; i++){
      for(int j = 0; j < rows; j++){
        //cells[i][j] = 0;
        cells[i][j] = (int)(random(0,2));
      }
    }
    for(int i = 0; i < 50; i++){
      generate();
    }
  }
  
  /* CREATE THE NEXT GENERATION OF CELLS */
  void generate(){
    // loop through the cells, avoiding going out of bounds
    for(int i = 0; i < cols; i++){
      // get your neighbors and your value
      int left = cells[(i+cols-1)%cols][generation % rows];
      int me = cells[i][generation%rows];
      int right = cells[(i+1)%cols][generation%rows];
      
      // based on the presence of your neighbors, regenerate or not
      cells[i][(generation+1)%rows] = rules(left, me, right);
    }
    // increment the generation
    generation++;
  }
  
  /* USE THE RULES TO MAKE THE NEXT GENERATION */
  int rules(int left, int me, int right){
    int index = 4*left + 2*me + 1*right;
    return ruleset[index];
  }
  
  /* PRINT THE CELLS TO OUR SCREEN */
  void drawCells(){
    int offset = generation%rows;

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        // calculate where to draw the row
        int y = j - offset;
        if (y <= 0){
          y = rows + y;
        }
        
        // choose the fill color based on if the 
        if (cells[i][j] == 1){
          // changed color of fill from first iteration
          if(j < cols/2){
            fill(60 + 2*j, 28, 31);
          }else{
            fill(140 - ((j-(cols/2))*2), 28, 31);
          }
        }else{
          fill(32, 30, 41); //38,50
        }
        noStroke();
        rect(i*w, (y-1)*w, w, w);
      }
    }
  }
}
