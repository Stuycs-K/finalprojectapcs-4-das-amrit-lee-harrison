import java.util.*;
import java.io.*;

 class Player{
  private String name;
  private int score;
  private ArrayList<Tile> hand;

  public Player(String giveName) {
    name = giveName;
    score = 0;
  }

  public void addScore(int amount) {
    score += amount;
  }

  public int getScore() {
    return score;
  }

  public String getName() {
    return name;
  }

  public ArrayList<Tile> getHand() {
    return hand;
  }

  public ArrayList<Tile> drawTiles(ArrayList<Tile> tilesToBeDrawn) {
    for (int i =0; i< tilesToBeDrawn.size(); i++) {
      hand.add(tilesToBeDrawn.get(i));
    }
    return tilesToBeDrawn;
  }
}
