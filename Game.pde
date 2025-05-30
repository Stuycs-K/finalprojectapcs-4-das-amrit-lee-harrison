Board grid = new Board();
int[][] lettermultipliers = grid.lettermultipliers;
int[][] wordmultipliers = grid.wordmultipliers;

void setup(){
  size(600,600);
  int size = 40;
  for(int x = 0; x < 15; x++){
    for(int y =0; y < 15; y++){
      if(lettermultipliers[x][y] == 2){
        fill(0,191,255);
        square(x * 40, y * 40, size);
      } else if(lettermultipliers[x][y] == 3){
        fill(0,128,255);
        square(x * 40, y * 40, size);
      } else if(wordmultipliers[x][y] == 2){
        fill(255,64,0);
        square(x * 40, y * 40, size);
      } else if(wordmultipliers[x][y] == 3){
        fill(255,0,0);
        square(x * 40, y * 40, size);
      } else{
        fill(255);
        square(x * 40, y * 40, size);
      }
    }
  }
}


      
  
