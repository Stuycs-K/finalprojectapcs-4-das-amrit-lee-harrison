import java.util.*;
import java.io.*;

 class Player{
  private String name;
  private int score;
  private ArrayList<Tile> hand;

  public Player(String giveName, ArrayList<Tile> giveHand) {
    name = giveName;
    score = 0;
    hand = giveHand;
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

  public void drawTiles(ArrayList<Tile> tilesToBeDrawn) {
    for (int i =0; i< tilesToBeDrawn.size(); i++) {
      hand.add(tilesToBeDrawn.get(i));
    }
  }
}
