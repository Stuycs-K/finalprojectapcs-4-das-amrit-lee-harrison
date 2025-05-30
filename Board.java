import java.util.*;
import java.io.*;

public class Board{
    public  static char[][] board;
    public  static int[][] lettermultipliers;
    public  static int[][] wordmultipliers;
    
    public Board(){
        board = new char[15][15];
        lettermultipliers = new int[15][15];
        wordmultipliers = new int[15][15];
        
    }

    public  static void lettering(){
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
        lettermultipliers[11][6] =2;
        lettermultipliers[11][14] = 2;
        lettermultipliers[12][6] = 2;
        lettermultipliers[12][8] = 2;
        lettermultipliers[13][5] = 3;
        lettermultipliers[13][9] = 3;
        lettermultipliers[14][3] = 2;
        lettermultipliers[14][11] = 2;
    }

    public  static void wording(){
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
    
    public static int getlet(int x, int y){
      return lettermultipliers[x][y];
    }
    public static int getwor(int x, int y){
      return wordmultipliers[x][y];
    }
    public static void main(String[] args){
        lettering();
        wording();
    }
}
