Board grid = new Board();
Player player1;
Player player2;
tilePool tilePool;
Dictionary dictionary;

void setup(){
  grid.lettering();
  grid.wording();
  size(600, 800);
  int size = 40;
  for(int x = 0; x < 15; x++){
    for(int y =0; y < 15; y++){
      if(grid.lettermultipliers[x][y] == 2){
        fill(0,191,255);
      } else if(grid.lettermultipliers[x][y] == 3){
        fill(0,128,255);
      } else if(grid.wordmultipliers[x][y] == 2){
        fill(255,120,0);
      } else if(grid.wordmultipliers[x][y] == 3){
        fill(255,0,0);
      } else{
        fill(255);
      }
      square(x * 40, y *40, size);
    }
  }
  
 noFill();
  rect(500, 600, 100, 100);
  fill(0,191,255);
  rect(510, 610, 10, 10);
  text("Double Letter", 525, 620);
  fill(0,128,255);
  rect(510, 630, 10, 10);
  text("Triple Letter", 525, 640);
  fill(255,120,0);
  rect(510, 650, 10, 10);
  text("Double Letter", 525, 660);
  fill(255,0,0);
  rect(510, 670, 10, 10);
  text("Triple Letter", 525, 680);
}

void newTurn(Player player) {
  int tilesNeeded = 7 - player.getHand().size();
  player.drawTiles(tilePool.removeTiles(tilesNeeded));
}
      
  
