import java.util.*;
import java.io.*;

public class tilePool {
    private ArrayList<Tile> tilePool;

    public tilePool() {
        int[] tileFrequency = { 9, 2, 2, 4, 12, 2, 3, 2, 9, 1, 1, 4, 2, 6, 8, 2, 1, 6, 4, 6, 4, 2, 2, 1,
                2, 1 };
        int ascii = 101;
        for (int i = 0; i < 26; i++) {
            for (int frequency = 0; frequency < tileFrequency[i]; frequency++) {
                Tile tile = new Tile((char) ascii);
                tilePool.add(tile);
            }
            ascii++;
        }
    }
}