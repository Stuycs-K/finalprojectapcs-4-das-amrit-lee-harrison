import java.util.*;

Board grid = new Board();
Player player1;
Player player2;
tilePool tilePool;
Dictionary dictionary;

//Size of board Vars
int tileSize = 40;

void setup(){
    size(600, 900);
  grid.lettering();
  grid.wording();
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
      square(x * tileSize, y *tileSize, tileSize);
    }
  }
  
 noFill();
 //Multiplier key
  rect(490, 600, 120, 120);
  fill(0,191,255);
  rect(500, 610, 15, 15);
  text("Double Letter", 525, 620);
  fill(0,128,255);
  rect(500, 635, 15, 15);
  text("Triple Letter", 525, 645);
  fill(255,120,0);
  rect(500, 660, 15, 15);
  text("Double Letter", 525, 670);
  fill(255,0,0);
  rect(500, 690, 15, 15);
  text("Triple Letter", 525, 700);
  //Score's of players
   noFill();
   rect(490, 720, 120, 120);
   line(490, 760, 600, 760);
  text("Player 1 Score", 525, 620);
  text("Double Letter", 525, 620);
  
  //initialize players
  player1 = new Player("Player");
  player2 = new Player("Player 2");
}

void restockHand(Player player) {
  int tilesNeeded = 7 - player.getHand().size();
  ArrayList<Tile> tilesGiven = tilePool.removeTiles(tilesNeeded);
  player.drawTiles(tilesGiven);
}

boolean gameOver() {
  return (player1.getScore() < 100 && player2.getScore() < 100);
}

void draw() {
}

void mouseDragged() {
  System.out.println("hello");
}
  

  
