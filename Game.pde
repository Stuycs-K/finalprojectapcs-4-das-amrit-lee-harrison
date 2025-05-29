Board grid = new Board();
void setup(){
  size(600,600);
  int size = 40;
  for(int x = 0; x < 15; x++){
    for(int y =0; y < 15; y++){
      if(grid.lettermultipliers[x][y] == 2){
        fill(0,191,255);
      } else if(grid.lettermultipliers[x][y] == 3){
        fill(0,128,255);
      } else if(grid.wordmultipliers[x][y] == 2){
        fill(255,64,0);
      } else if(grid.wordmultipliers[x][y] == 3){
        fill(255,0,0);
      } 
      square(x * 40, y * 40, size);
    }
  }
}


void draw(){
  setup();
}
      
  
