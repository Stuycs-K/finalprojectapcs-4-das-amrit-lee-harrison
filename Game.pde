import java.util.*;
import java.io.*;

Board grid = new Board();
Player player1;
//Player player2;
tilePool tilePool;
Dictionary dictionary = new Dictionary();
boolean flag = true;
Tile selectedTile;
int counter = 0;

//Size of board Vars
int tileSize = 40;
//SETUP
void setup() {
  size(600, 800);
  initializeBoard();
  initializePlayers();
  dictionary.reader("Dict.txt");
}



//creating the players
void initializePlayers() {
  player1 = new Player("Player 1");
  //player2 = new Player("Player 2");
  dictionary = new Dictionary();
  tilePool = new tilePool();
  restockHand(player1);
  //restockHand(player2);
}





//setting up the board
void initializeBoard() {
  grid.lettering();
  grid.wording();
  for (int x = 0; x < 15; x++) {
    for (int y =0; y < 15; y++) {
      if (grid.lettermultipliers[x][y] == 2) {
        fill(0, 191, 255);
      } else if (grid.lettermultipliers[x][y] == 3) {
        fill(0, 128, 255);
      } else if (grid.wordmultipliers[x][y] == 2) {
        fill(255, 120, 0);
      } else if (grid.wordmultipliers[x][y] == 3) {
        fill(255, 0, 0);
      } else if (x == 7 && y == 7) {
        fill(255, 0, 0);
      } else {
        fill(255);
      }
      square(x * tileSize, y *tileSize, tileSize);
    }
  }
  noFill();
  //Multiplier key
  rect(490, 600, 120, 120);
  fill(0, 191, 255);
  rect(500, 610, 15, 15);
  textSize(15);
  text("Double Letter", 560, 620);
  fill(0, 128, 255);
  rect(500, 635, 15, 15);
  text("Triple Letter", 560, 645);
  fill(255, 120, 0);
  rect(500, 660, 15, 15);
  text("Double Word", 560, 670);
  fill(255, 0, 0);
  rect(500, 690, 15, 15);
  text("Triple Word", 560, 700);
  //Score's of players
  noFill();
  rect(490, 720, 120, 120);
  //line(490, 760, 600, 760);
  text("Player 1 Score", 550, 730);
}



//Restocking the hand for the player;
void restockHand(Player player) {
  int tilesNeeded = 7 - player.getHand().size();
  if (tilesNeeded >0 && tilePool.tilesLeft() > 0) {
    ArrayList<Tile> tilesGiven = tilePool.removeTiles(tilesNeeded);
    player.drawTiles(tilesGiven);
    for (int i =0; i < player.getHand().size(); i++) {
      player.getHand().get(i).setLocation(100 + (i * 50), 730);
    }
  }
}

boolean gameOver() {
  return (player1.getScore() < 100); //&& player2.getScore() < 100);
}

//Method to draw the board when a tile has been placed on the board
void draw() {
  background(240);
  initializeBoard();
  drawConfirmButton();
  drawRack(player1);
  //else{
  //  drawRack(player2);
  //}
  for (int i =0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      Tile tile = grid.getBoard(i, j);
      if (tile != null) {
        tile.display();
      }
    }
  }
  text("" + player1.getScore(), 550, 750);
}

//This drawRack should be dependent on the Player;

void drawRack(Player player) {
  int increment = 20;
  textSize(10);
  text(player.getName(), 30, 650);
  for (Tile t : player1.getHand()) {
    t.display();
    increment+=50;
  }
}

void drawConfirmButton() {
  fill(50, 205, 50);
  rect(380, 650, 100, 40);
  fill(0, 0, 0);
  text("Confirm Word", 430, 670);
  //function to check dictionary
  counter = 0;
}
void drawRack() {
  textSize(20);
  text("Player 1", 30, 620);
  for (Tile t : player1.getHand()) {
    t.display();
  }
}

void mousePressed() {
  int xBoard = mouseX/ 40;
  int yBoard = mouseY/40;
  if (mouseY > 600 && selectedTile == null) {
    //System.out.println( mouseX + ", " + mouseY);
    for (Tile tile : player1.getHand()) {
      //System.out.println(tile.getX() + "," + tile.getY());
      if (tile.mouseOnTile(mouseX, mouseY) ) {
        selectedTile = tile;
        return;
      }
    }
  }
  if (selectedTile != null && xBoard >= 0 && xBoard < 15 && yBoard >= 0 && yBoard < 15) {
    if (grid.getBoard(xBoard, yBoard) == null) {
      counter++;
      System.out.println(counter);
      grid.setTile(xBoard, yBoard, selectedTile);
      grid.setStatus(xBoard, yBoard, true);
      selectedTile.setLocation(xBoard * 40, yBoard * 40);
      int tileIndex = player1.tileIndex(selectedTile);
      //System.out.println(tileIndex);
      if (tileIndex >= 0) {
        player1.getHand().remove(tileIndex);
      }
    }
    selectedTile = null;
    restockHand(player1);
    System.out.println("tile placed");
  }
  if ((mouseX >= 380 && mouseX <= 480) && (mouseY >= 650 & mouseY <= 690)) {
    if (grid.wordle(xBoard, yBoard, counter)) {
      int points = grid.additions(xBoard, yBoard, counter);
      //System.out.println(points);
      player1.addScore(points);
      //System.out.println(player1.getScore());
    }
  }
}
