import java.util.*;
import java.io.*;

class Board {
  Dictionary dictionary;
  public  Tile[][] board;
  public  int[][] lettermultipliers;
  public  int[][] wordmultipliers;
  public boolean[][] status;
  private ArrayList<Integer> temp1 = new ArrayList<Integer> ();
  private ArrayList<Integer> temp2 = new ArrayList<Integer>();

  public Board(Dictionary dict) {
    dictionary = dict;
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
  public boolean wordlehor(ArrayList<int[]> placedTiles) {
    temp1.clear();
    if (placedTiles.size() == 0) {
      return false;
    }
    int startx = placedTiles.get(0)[0];
    int y = placedTiles.get(0)[1];
    while (startx > 0 && board[startx - 1][y] != null) {
      startx--;
    }
    String word = "";
    int x = startx;
    while (x < 15 && board[x][y] != null) {
      word += board[x][y].getLetter();
      temp1.add(x);
      x++;
    }
    System.out.println("Word(hor): " + word);
    return dictionary.result(word);
  }

  public boolean wordlever(ArrayList<int[]> placedTiles) {
    temp2.clear();
    if (placedTiles.size() == 0) {
      return false;
    }
    int starty = placedTiles.get(0)[1];
    int x = placedTiles.get(0)[0];
    while (starty > 0 && board[x][starty - 1] != null) {
      starty--;
    }
    String word = "";
    int y = starty;
    while (y < 15 && board[x][y] != null) {
      word += board[x][y].getLetter();
      temp2.add(y);
      y++;
    }
    System.out.println("Word(ver): " + word);
    return dictionary.result(word);
  }
  public int additions(ArrayList<int[]> placedTiles) {
    int retu = 0;
    int mult = 1;

    boolean hor = wordlehor(placedTiles);
    boolean ver = wordlever(placedTiles);


    if (hor) {
      int y = placedTiles.get(0)[1];
      for (int x : temp1) {
        Tile tile = board[x][y];
        if (tile != null) {
          int letterscore = tile.getValue();
          int lettermult = 1;
          boolean isNew = false;

          for (int[] placed : placedTiles) {
            if (placed[0] == x && placed[1] == y) {
              isNew = true;
              break;
            }
          }
          if (isNew) {
            if (lettermultipliers[x][y] > 0) {
              lettermult = lettermultipliers[x][y];
            }
            if (wordmultipliers[x][y] > 0) {
              mult *= wordmultipliers[x][y];
            }
          }
          retu+= letterscore * lettermult;
        }


        int lmulti = 1;
        if (lettermultipliers[x][y] > 0) {
          lmulti = lettermultipliers[x][y];
        }

        retu += tile.getValue() * lmulti;

        if (wordmultipliers[x][y] > 0) {
          mult *= wordmultipliers[x][y];
        }
      }
    } else if (ver) {
      int x = placedTiles.get(0)[0];
      for (int y : temp2) {
        Tile tile = board[x][y];
        if (tile != null) {
          int letterScore = tile.getValue();
          int letterMultiplier = 1;
          boolean isNew = false;

          for (int[] placed : placedTiles) {
            if (placed[0] == x && placed[1] == y) {
              isNew = true;
              break;
            }
          }

          if (isNew) {
            if (lettermultipliers[x][y] > 0) {
              letterMultiplier = lettermultipliers[x][y];
            }
            if (wordmultipliers[x][y] > 0) {
              mult *= wordmultipliers[x][y];
            }
          }

          retu += letterScore * letterMultiplier;
        }
      }
    }

    int total = retu * mult;
    System.out.println("Score calculated: " + total);
    return total;
  }
  
  public String getHorizontalWord(int x, int y) {
    int beginning = x;
    int ending = x;
    String returnStr = "";
    while (beginning >= 0 && board[beginning][y] != null) {
      beginning--;
    }
    beginning++;
    while (ending < 15 && board[ending][y] != null) {
      ending++;
    }
    ending--;
    for (int i = beginning; i <= ending; i++) {
      returnStr += board[i][y].getLetter();
    }
    return returnStr;
}

 public String getVerticalWord(int x, int y) {
    int beginning = y;
    int ending = y;
    String returnStr = "";
    while (beginning >= 0 && board[x][beginning] != null) {
      beginning--;
    }
    beginning++;
    while (ending < 15 && board[x][ending] != null) {
      ending++;
    }
    ending--;
    for (int i = beginning; i <= ending; i++) {
      returnStr += board[x][i].getLetter();
    }
    return returnStr;
}
}
