Board grid = new Board();
Player player1;
Player player2;
tilePool tilePool;
Dictionary dictionary;

void setup(){
  grid.lettering();
  grid.wording();
  size(600, 900);
  int size = 30;
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
      } else{
        fill(255);
      }
      square(x * 30, y * 30, size);
    }
  }
  
 noFill();
  rect(0, 600, 100, 120);
  fill(0,191,255);
  rect(10, 610, 10, 10);
  text("Double Letter", 25, 610);
  fill(0,128,255);
  rect(10, 485, 10, 10);
  text("Trippble Letter", 25, 475);
}

void newTurn(Player player) {
  int tilesNeeded = 7 - player.getHand().size();
  player.drawTiles(tilePool.removeTiles(tilesNeeded));
}
      
  
