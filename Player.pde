import java.util.*;
import java.io.*;

class Player {
  private String name;
  private int score;
  private ArrayList<Tile> hand = new ArrayList<Tile>(0);

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
  public String scr() {
    return String.valueOf(score);
  }

  public String getName() {
    return name;
  }

  public ArrayList<Tile> getHand() {
    return hand;
  }

  public void removeTile(int index) {
    hand.remove(index);
  }

  public int tileIndex(Tile tile) {
    return hand.indexOf(tile);
  }

  public void drawTiles(ArrayList<Tile> tilesToBeDrawn) {
    for (int i =0; i< tilesToBeDrawn.size(); i++) {
      hand.add(tilesToBeDrawn.get(i));
    }
  }
}
