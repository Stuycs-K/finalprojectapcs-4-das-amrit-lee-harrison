import java.util.*;
import java.io.*;

public class Player{
  private String name;
  private int score;
  private ArrayList<Tile> hand;

  public Player(String giveName) {
    name = giveName;
  }

  public addScore(int amount) {
    score += amount;
  }

  public drawTiles(ArrayList<Tile> tilesToBeDrawn) {
    for (int i =0; i< tilesToBeDrawn.size(); i++) {
      hand.add(tilesToBeDrawn.get(i);
    }
  }
}
