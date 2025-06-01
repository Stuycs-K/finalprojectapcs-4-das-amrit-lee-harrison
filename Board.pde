import java.util.*;
import java.io.*;

 class Board{
    public  Tile[][] board;
    public  int[][] lettermultipliers;
    public  int[][] wordmultipliers;
    
    public Board(){
        board = new Tile[15][15];
         for (int i =0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      Tile tile = new Tile('A', 30, 30);
      board[i][j] = tile;
    }
         }
        lettermultipliers = new int[15][15];
        wordmultipliers = new int[15][15];
        
    }

    public  void lettering(){
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

    public  void wording(){
        wordmultipliers[0][0] = 3;
        wordmultipliers[0][7] = 3;
        wordmultipliers[0][14] = 3;
        for(int x = 1; x <= 4; x++){
            wordmultipliers[x][x] = 2;
            wordmultipliers[14 - x][x] = 2;
        }
        for(int x = 10; x < 14; x++){
            wordmultipliers[x][x] = 2;
            wordmultipliers[14 - x][x] = 2;
        }
        wordmultipliers[14][0] = 3;
        wordmultipliers[14][7] = 3;
        wordmultipliers[14][14] = 3;
        wordmultipliers[7][0] = 3;
        wordmultipliers[7][7] = 3;
        wordmultipliers[7][14] = 3;

    }
    
    public  int getlet(int x, int y){
      return lettermultipliers[x][y];
    }
    public  int getwor(int x, int y){
      return wordmultipliers[x][y];
    }
    
    public Tile getBoard(int x, int y) {
      return board[x][y];
    }
    public  void main(String[] args){
        lettering();
        wording();
    }
}
