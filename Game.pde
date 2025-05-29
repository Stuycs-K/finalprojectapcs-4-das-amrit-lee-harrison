final int SQUARE_SIZE = displayHeight/15;
Board grid = new Board();

void setup() {
  size(1000,1000);
  background(255,255,255);
  for(int y = 0; y < grid.length; y++){
    for(int x = 0; x < grid[y].length; x++){
      fill(255);
      square(y, x, SQUARE_SIZE);
    }
    
}
      

                     

  //ALTERNATE INITIALIZATION:
  //After you test the above array:
  //change this in the constant above: SQUARE_SIZE=20;
  //grid = new int[height/SQUARE_SIZE][width/SQUARE_SIZE];
  //optionally loop over the array and assign random 1/0 values.
}

/**1. Fill the screen with Black Squares with a white border
  *this is a practice method to help you with part 2.
  *The intended behavior is to only place squares that fit on the screen, not partial ones on the edge.
  *When the square size is 100,there should be a 15 pixel gap on the right and bottom sides of the window.
  *Remember that arrays use r,c, but positional methods use (x,y) which translates to (c,r) in this case.
  */
void grid() {
  color filler = color(0,0,0);
  stroke(255,255,255);
  for(int x = 0; x < height; x += SQUARE_SIZE){
    for(int y = 0; y < width; y+= SQUARE_SIZE){
        stroke(255,255,255);
        fill(filler);
        square(x,y, SQUARE_SIZE);
    }
  }
}

/**2. Fill the screen with Squares with a white border
 *When the corresponding value of colors is 0, fill with color(100)
 *When the corresponding value of colors is not 0, fill with color(200)
 */
void grid(int[][]colors) {
  for(int y = 0; y < colors.length; y++){
    for(int x = 0; x < colors[y].length; x++){
      stroke(255,255,255);
      int o = 0;
      if(colors[y][x] == 0){
        o = 100;
      } else if(colors[y][x] != 0){
        o = 200;
      }
      fill(o);
      square(x * SQUARE_SIZE, y * SQUARE_SIZE, SQUARE_SIZE);
    }
  }
}


//The draw() function is run repeatedly after setup() is run once.
//This method is limited to 60 times per second, but can run slower
//The method only stops when you exit the program.
void draw() {
  grid(grid);
  //grid(grid);//switch over to this after part 1 works.
}
