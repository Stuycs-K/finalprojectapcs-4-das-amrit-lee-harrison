import java.util.*;
import java.io.*;

public class Board{
    private static char[][] board = new char[15][15];
    private static int[][] lettermultipliers = new char[15][15];
    private static int[][] wordmultipliers = new char[15][15];

    public static void lettering(){
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
        lettermultipliers[11][15] = 2;
        lettermultipliers[12][6] = 2;
        lettermultipliers[12][8] = 2;
        lettermultipliers[13][5] = 3;
        lettermultipliers[13][9] = 3;
        lettermultipliers[14][3] = 2;
        lettermultipliers[14][11] = 2;
    }
    public static void main(String[] args){
        
    }
}