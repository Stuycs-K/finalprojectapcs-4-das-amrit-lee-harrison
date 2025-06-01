import java.util.*;

Board grid = new Board();
Player player1;
Player player2;
tilePool tilePool;
Dictionary dictionary;
Tile selectedTile;

//Size of board Vars
int tileSize = 40;

void setup(){
  size(600, 800);
    initializeBoard();
    initializePlayers();
}

void initializePlayers() {
    player1 = new Player("Player");
  player2 = new Player("Player 2");
  dictionary = new Dictionary();
    tilePool = new tilePool();
  restockHand(player1);
   restockHand(player2);
}

void initializeBoard() {
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
}

void restockHand(Player player) {
  int tilesNeeded = 7 - player.getHand().size();
  if (tilesNeeded >0 && tilePool.tilesLeft() > 0) {
  ArrayList<Tile> tilesGiven = tilePool.removeTiles(tilesNeeded);
  player.drawTiles(tilesGiven);
}
}

boolean gameOver() {
  return (player1.getScore() < 100 && player2.getScore() < 100);
}

void draw() {
  drawRack();
  for (int i =0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      Tile tile = grid.getBoard(i, j);
      if (tile != null) {
        tile.display(i*40, j*40);
      }
    }
  }
}

void drawRack() {
  int increment = 20;
  textSize(30);
  text("Player 1", 10, 760);
  for (Tile t: player1.getHand()) {
    t.display(100 + increment, 730);
    increment+=50;
}
}

void mousePressed() {
  int xBoard = mouseX/ 40;
  int yBoard = mouseY/40;
  for (Tile tile: player1.getHand()) {
    if (tile.mouseOnTile(mouseX, mouseY) ) {
    }
    selectedTile = tile;
    return;
  }
  else if (grid.getBoard(xBoard, yBoard) == null) {
   grid.setTile(xBoard, yBoard, selectedTile);
}
}
  

  
