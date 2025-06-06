import java.util.*;
import java.io.*;

class Board {
  public  Tile[][] board;
  public  int[][] lettermultipliers;
  public  int[][] wordmultipliers;
  public boolean[][] status;
  private ArrayList<Integer> temp1 = new ArrayList<Integer> ();
  private ArrayList<Integer> temp2 = new ArrayList<Integer>();

  public Board() {
    board = new Tile[15][15];
    lettermultipliers = new int[15][15];
    wordmultipliers = new int[15][15];
    status = new boolean[15][15];
    for (int x = 0; x < 15; x++) {
      for (int y = 0; y< 15; y++) {
        status[x][y] = false;
      }
    }
  }

  public  void lettering() {
    lettermultipliers[0][3] = 2;
    lettermultipliers[0][11] = 2;
    lettermultipliers[1][5] = 3;
    lettermultipliers[1][9] = 3;
    lettermultipliers[2][6] = 2;
    lettermultipliers[2][8] = 2;
    lettermultipliers[3][7] = 2;
    lettermultipliers[3][0] = 2;
    lettermultipliers[3][14] = 2;
    lettermultipliers[5][1] = 3;
    lettermultipliers[5][5] = 3;
    lettermultipliers[5][9] = 3;
    lettermultipliers[5][13] = 3;
    lettermultipliers[6][2] = 2;
    lettermultipliers[6][6] = 2;
    lettermultipliers[6][8] = 2;
    lettermultipliers[6][12] = 2;
    lettermultipliers[7][3] = 2;
    lettermultipliers[7][11] = 2;
    lettermultipliers[8][2] = 2;
    lettermultipliers[8][6] = 2;
    lettermultipliers[8][8] = 2;
    lettermultipliers[8][12] = 2;
    lettermultipliers[9][1] = 3;
    lettermultipliers[9][5] = 3;
    lettermultipliers[9][9] = 3;
    lettermultipliers[9][13] = 3;
    lettermultipliers[11][0] = 2;
    lettermultipliers[11][7] =2;
    lettermultipliers[11][14] = 2;
    lettermultipliers[12][6] = 2;
    lettermultipliers[12][8] = 2;
    lettermultipliers[13][5] = 3;
    lettermultipliers[13][9] = 3;
    lettermultipliers[14][3] = 2;
    lettermultipliers[14][11] = 2;
  }

  public  void wording() {
    wordmultipliers[0][0] = 3;
    wordmultipliers[0][7] = 3;
    wordmultipliers[0][14] = 3;
    for (int x = 1; x <= 4; x++) {
      wordmultipliers[x][x] = 2;
      wordmultipliers[14 - x][x] = 2;
    }
    for (int x = 10; x < 14; x++) {
      wordmultipliers[x][x] = 2;
      wordmultipliers[14 - x][x] = 2;
    }
    wordmultipliers[14][0] = 3;
    wordmultipliers[14][7] = 3;
    wordmultipliers[14][14] = 3;
    wordmultipliers[7][0] = 3;
    wordmultipliers[7][14] = 3;
  }

  public void setStatus(int x, int y, boolean stas) {
    status[x][y] = stas;
  }

  public Tile getBoard(int x, int y) {
    return board[x][y];
  }

  public void setTile(int x, int y, Tile tile) {
    board[x][y] = tile;
  }
  public  void main(String[] args) {
    lettering();
    wording();
  }

  public boolean wordlehor(int x, int y, int counts) {
    temp1.clear();
    String word = "";
    while (counts > 0) {
      System.out.println(counts);
      //adding
      if(board[x- counts][y] != null){
        word += board[x-counts][y].getLetter();
      }
      temp1.add(x- counts);
      counts--;
    }
    if (dictionary.result(word)) {
      return true;
    }
    return false;
  }

  public boolean wordlever(int x, int y, int counts) {
    temp2.clear();
    String word = "";
    while (counts > 0) {
      //adding
      if(board[x][y - counts] != null){
        word += board[x][y - counts];
      }
      temp2.add(y - counts);
      counts--;
    }
    if (dictionary.result(word)) {
      return true;
    }
    return false;
  }

  public boolean wordle(int x, int y, int counts) {
    if (wordlehor(x, y, counts) || wordlever(x, y, counts)) {
      return true;
    }
    return false;
  }

  public int additions(int x, int y, int counts) {
    int retu = 0;
    if (!wordle(x, y, counts)) {
      return 0;
    }
    if (wordlehor(x, y, counts)) {
      for (int k = 0; k < temp1.size(); k++) {
        retu += lettermultipliers[temp1.get(k)][y] * board[temp1.get(k)][y].getValue();
        retu += wordmultipliers[temp1.get(k)][y] * board[temp1.get(k)][y].getValue();
      }
    }
    if (wordlever(x, y, counts)) {
      for (int k = 0; k < temp2.size(); k++) {
        retu += lettermultipliers[temp2.get(k)][y] * board[x][temp2.get(k)].getValue();
        retu += wordmultipliers[temp2.get(k)][y] * board[x][temp2.get(k)].getValue();
      }
    }
    return retu;
  }
}
