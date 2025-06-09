
import java.util.*;
import java.io.*;

Dictionary dictionary = new Dictionary();
ArrayList<int[]> placedTiles = new ArrayList<int[]> ();
Board grid = new Board(dictionary);
Player player1;
Player player2;
Player currentPlayer;
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
ArrayList<Tile> pendingTiles = new ArrayList<Tile>();
ArrayList<float[]> pendingTilesLocation = new ArrayList<float[]>();

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
    initializePlayers();
  initializeBoard();
  dictionary.reader("Dict.txt");
}

//Method to draw the board when a tile has been placed on the board
void draw() {
  //System.out.println(flag);
  background(211, 211, 211);
  initializeBoard();
  drawConfirmButton();
  drawWarnings();
  drawRack(currentPlayer);
  for (int i =0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      Tile tile = grid.getBoard(i, j);
      if (tile != null) {
        tile.display();
      }
    }
  }
     textSize(30);
     text("" + player1.getScore(), 550, 720);
     text("" + player2.getScore(), 550, 775);

}


//warns the user does something bad
void drawWarnings() {
  if (tileWarning == false) {
    time1 = millis();
  }
  if (millis() - time1 < interval && tileWarning == true) {
    System.out.println(millis());
    System.out.println(time1);
    text("Warning: This spot already has a tile!", 250, 630);
  }
  if (millis() - time1 >= interval) {
    tileWarning = false;
  }
  if (tileWarning2 == false) {
    time2 = millis();
  }
  if (millis() - time2 < interval && tileWarning2 == true) {
    System.out.println(millis());
    System.out.println(time2);
    text("Put the tile in the center spot!", 250, 630);
  }
  if (millis() - time2 >= interval) {
    tileWarning2 = false;
  }
}


//creating the players
void initializePlayers() {
  player1 = new Player("Player 1");
  player2 = new Player("Player 2");
  tilePool = new tilePool();
  restockHand(player1);
  restockHand(player2);
  currentPlayer = player1;
}

void endTurn() {
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
  rect(490, 600, 120, 140);
  fill(0, 191, 255);
  rect(500, 605, 10, 10);
  textSize(10);
  text("Double Letter", 550, 610);
  fill(0, 128, 255);
  rect(500, 625, 10, 10);
  text("Triple Letter", 550, 630);
  fill(255, 120, 0);
  rect(500, 645, 10, 10);
  text("Double Word", 550, 650);
  fill(255, 0, 0);
  rect(500, 665, 10, 10);
  text("Triple Word", 550, 670);
  //Score's of players
  noFill();
  rect(490, 680, 120, 120);
  //line(490, 760, 600, 760);
  text("Player 1 Score", 550, 690);
  text("Player 2 Score", 550, 750);
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
  for (Tile t : player.getHand()) {
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

void undoMove() {
  if (pendingTiles.size() > 0) {
    for (int i = 0; i < pendingTiles.size(); i++) {
      int x = (int) (pendingTiles.get(i).getX()/40);
      int y = (int) (pendingTiles.get(i).getY()/40);
      grid.setTile(x, y, null);
      currentPlayer.getHand().add(pendingTiles.get(i));
      pendingTiles.get(i).setLocation(pendingTilesLocation.get(i)[0], pendingTilesLocation.get(i)[1]);
    }
  }
  pendingTiles.clear();
  pendingTilesLocation.clear();
}

void mousePressed() {
  //System.out.println("mousePressed called. MouseX: " + mouseX + " " + mouseY);
  int xBoard = mouseX/ 40;
  int yBoard = mouseY/40;
  if (mouseY > 690 && selectedTile == null) {
    //System.out.println("selecting tile");
    for (Tile tile : currentPlayer.getHand()) {
      if (tile.mouseOnTile(mouseX, mouseY) ) {
        selectedTile = tile;
        return;
      }
    }
  }
  if (selectedTile != null && xBoard >= 0 && xBoard < 15 && yBoard >= 0 && yBoard < 15) {
    //System.out.println("placing  tile");
    if (grid.getBoard(xBoard, yBoard) == null) {
      if (turn == 0 && (xBoard != 7 || yBoard != 7) && currentPlayer.getHand().size() == 7) {
        System.out.println("time warning");
        tileWarning2 = true;
      } else {
        flags = true;
           float[] array = {selectedTile.getX(), selectedTile.getY()};
        pendingTilesLocation.add(array);
        grid.setTile(xBoard, yBoard, selectedTile);
        grid.setStatus(xBoard, yBoard, true);
        selectedTile.setLocation(xBoard * 40, yBoard * 40);
        placedTiles.add(new int[] {xBoard, yBoard});
        pendingTiles.add(selectedTile);
        counter++;
        int tileIndex = currentPlayer.tileIndex(selectedTile);
        //System.out.println(tileIndex);
        if (tileIndex >= 0) {
          currentPlayer.getHand().remove(tileIndex);
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
    boolean isVer;
    ArrayList<int[]> recents = new ArrayList<int[]>();
    int size = placedTiles.size();
    for (int i = size - counter; i < size; i++) {
      recents.add(placedTiles.get(i));
    }
    boolean hor = grid.wordlehor(recents, counter);
    //System.out.println("hor:" +hor);
    boolean ver = grid.wordlever(recents, counter);
    //System.out.println("veer:" + ver);
    if (ver || hor) {
      for (int[] pos : recents) {
        //System.out.println("Verify: " + pos[0] + ", " + pos[1]);
      }
      isVer = ver;
      int score = grid.additions(recents, counter);
      currentPlayer.addScore(score);
      score = 0;
      //System.out.println(score);
      restockHand(currentPlayer);
      recents.removeAll(recents);
      turn++;
      pendingTilesLocation.clear();
      pendingTiles.clear();
      if (currentPlayer == player1) {
        currentPlayer = player2;
      }
      else {
        currentPlayer = player1;
      }

    }
    else {
      undoMove();
    }
    counter = 0;
    flags = false;
    placedTiles.clear();
    //System.out.println("_________________________");
  }
}
