import java.util.*;

Board grid = new Board();
Player player1;
Player player2;
tilePool tilePool;
Dictionary dictionary = new Dictionary();
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
  text("Double Word", 525, 670);
  fill(255,0,0);
  rect(500, 690, 15, 15);
  text("Triple Word", 525, 700);
  //Score's of players
   noFill();
   rect(490, 720, 120, 120);
   line(490, 760, 600, 760);
  text("Player 1 Score", 515, 730);
  text("Player 2 Score", 515,770);
}

void restockHand(Player player) {
  int tilesNeeded = 7 - player.getHand().size();
  if (tilesNeeded >0 && tilePool.tilesLeft() > 0) {
  ArrayList<Tile> tilesGiven = tilePool.removeTiles(tilesNeeded);
  player.drawTiles(tilesGiven);
  for (int i =0; i < player1.getHand().size();i++) {
    player.getHand().get(i).setLocation(100 + (i * 50), 730);
  }
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
        tile.display();
      }
    }
  }
}

void drawRack() {
  int increment = 20;
  textSize(30);
  text("Player 1", 30, 650);
  for (Tile t: player1.getHand()) {
    t.display();
    increment+=50;
}
}

void mousePressed() {
  int xBoard = mouseX/ 40;
  int yBoard = mouseY/40;
  if (mouseY > 600 && selectedTile == null) {
     System.out.println( mouseX + ", " + mouseY);
  for (Tile tile: player1.getHand()) {
    System.out.println(tile.getX() + "," + tile.getY());
    if (tile.mouseOnTile(mouseX, mouseY) ) {
    selectedTile = tile;
    return;
  }
  }
  }
   if (selectedTile != null && xBoard >= 0 && xBoard < 15 && yBoard >= 0 && yBoard < 15) {
  if (grid.getBoard(xBoard, yBoard) == null) {
   grid.setTile(xBoard, yBoard, selectedTile);
   selectedTile.setLocation(xBoard * 40, yBoard * 40);
   selectedTile = null;
   System.out.println("tile placed");
}
}
}
  

  
