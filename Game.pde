import java.util.*;
import java.io.*;

Dictionary dictionary = new Dictionary();
ArrayList<int[]> placedTiles = new ArrayList<int[]> ();
Board grid = new Board(dictionary);
Player player1;
//Player player2;
tilePool tilePool;
boolean flag = true;
Tile selectedTile;
int counter = 0;
int interval = 2000;
int turn = 0;
boolean win1 = false;
boolean win2 = false;
//tile placed on another
int time1;
boolean tileWarning;
boolean flags = false;

int lastx = 0;
int lasty = 0;

//tile not placed on starting tile
int time2;
boolean tileWarning2;


//Size of board Vars
int tileSize = 40;
//SETUP
void setup() {
  size(600, 800);
  initializeBoard();
  initializePlayers();
  dictionary.reader("Dict.txt");
}

//Method to draw the board when a tile has been placed on the board
void draw() {
  background(211, 211, 211);
  initializeBoard();
  drawConfirmButton();
  drawWarnings();
  if (flag) {
    drawRack(player1);
  }
  //else{
  //drawRack(player2);
  //}
  for (int i =0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      Tile tile = grid.getBoard(i, j);
      if (tile != null) {
        tile.display();
      }
    }
  }
  //System.out.println(player1.getScore());
  textSize(30);
  text("" + player1.getScore(), 550, 750);
}


//warns the user does something bad
void drawWarnings() {
  if (tileWarning == false) {
    time1 = millis();
  }
  if (millis() - time1 < interval && tileWarning == true) {
    text("Warning: This spot already has a tile!", 250, 630);
  }
  if (millis() - time1 >= interval) {
    tileWarning = false;
  }
  if (tileWarning2 == false) {
    time2 = millis();
  }
  if (millis() - time2 < interval && tileWarning2 == true) {
    text("Put the tile in the center spot!", 250, 630);
  }
  if (millis() - time2 >= interval) {
    tileWarning2 = false;
  }
}


//creating the players
void initializePlayers() {
  player1 = new Player("Player 1");
  //player2 = new Player("Player 2");
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

void gameOver() {
  if (player1.getScore() >= 100) {
    win1 = true;
  }
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
}
void drawRack() {
  textSize(20);
  text("Player 1", 30, 620);
  for (Tile t : player1.getHand()) {
    t.display();
  }
}

void mousePressed() {
  //System.out.println("mousePressed called. MouseX: " + mouseX + " " + mouseY);
  int xBoard = mouseX/ 40;
  int yBoard = mouseY/40;
  if (mouseY > 690 && selectedTile == null) {
    //System.out.println("selecting tile");
    for (Tile tile : player1.getHand()) {
      if (tile.mouseOnTile(mouseX, mouseY) ) {
        selectedTile = tile;
        return;
      }
    }
  }
  if (selectedTile != null && xBoard >= 0 && xBoard < 15 && yBoard >= 0 && yBoard < 15) {
    //System.out.println("placing  tile");
    if (grid.getBoard(xBoard, yBoard) == null) {
      if (turn == 0 && (xBoard != 7 || yBoard != 7) && player1.getHand().size() == 7) {
        System.out.println("time warning");
        tileWarning2 = true;
      } else {
        flags = true;
        grid.setTile(xBoard, yBoard, selectedTile);
        grid.setStatus(xBoard, yBoard, true);
        selectedTile.setLocation(xBoard * 40, yBoard * 40);
        placedTiles.add(new int[] {xBoard, yBoard});
        counter++;
        int tileIndex = player1.tileIndex(selectedTile);
        //System.out.println(tileIndex);
        if (tileIndex >= 0) {
          player1.getHand().remove(tileIndex);
        }
        //System.out.println("tile placed successfully");
      }
    } else {
      tileWarning = true;
    }
    selectedTile = null;
   // System.out.println(counter);
  }
  if ((mouseX >= 380 && mouseX <= 480) && (mouseY >= 650 & mouseY <= 690)) {
    ArrayList<int[]> recents = new ArrayList<int[]>();
    int size = placedTiles.size();
    for (int i = size - counter; i < size; i++) {
      recents.add(placedTiles.get(i));
    }
    System.out.println("confirm button");
    boolean hor = grid.wordlehor(recents);
    System.out.println(hor);
    boolean ver = grid.wordlever(recents);
    System.out.println(ver);
    if (ver || hor) {
      turn++;
      int score = grid.additions(recents);
      player1.addScore(score);
      restockHand(player1);
      recents.removeAll(recents);
           System.out.println("Grah:" + recents.toString());
    }
    counter = 0;
    flags = false;
    placedTiles.clear();
  }
}
