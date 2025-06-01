import java.util.*;
import java.io.*;

public class tilePool {
    private ArrayList<Tile> tilePool = new ArrayList<>();

    public tilePool() {
        int[] tileFrequency = { 9, 2, 2, 4, 12, 2, 3, 2, 9, 1, 1, 4, 2, 6, 8, 2, 1, 6, 4, 6, 4, 2, 2, 1,
                2, 1 };
        int ascii = 65;
        for (int i = 0; i < 26; i++) {
            for (int frequency = 0; frequency < tileFrequency[i]; frequency++) {
                Tile tile = new Tile((char) ascii, -1, -1);
                tilePool.add(tile);
            }
            ascii++;
        }
    }

    public String toString() {
        char[] letters = new char[tilePool.size()];
        for (int i = 0; i < tilePool.size(); i++) {
            letters[i] = tilePool.get(i).getLetter();
        }
        return Arrays.toString(letters);
    }
//gets amount number of tiles from tilePool and puts them in an ArrayList
    public ArrayList<Tile> removeTiles(int amount) {
      ArrayList<Tile> removedTiles = new ArrayList<Tile>(amount);
      for (int i =0; i < amount; i++) {
        int random = (int) (Math.random() * tilePool.size());
        removedTiles.add(tilePool.remove(random));
      }
      return removedTiles;
    }
}
