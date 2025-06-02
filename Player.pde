import java.util.*;
import java.io.*;

 class Player{
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
  public String scr(){
    return String.valueOf(score);
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
  
  public boolean found(){
    String current = "";
    for(int x = 0; x < hand.size(); x++){
      current += hand.get(x).getLetter();
    }
    return dictionary.result(current);
  }
  
  public int scoreup(){
    int x = 0;
    if(this.found()){
      for(int y = 0; y <hand.size(); y++){
        x += hand.get(y).getValue();
      }
    }
    return x;
  }
}
