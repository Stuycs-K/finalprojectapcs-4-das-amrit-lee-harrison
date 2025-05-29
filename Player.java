import java.util.*;
import java.io.*;

public class Player{
  private String name;
  private int score;
  private ArrayList<Tile> hand;

  public Player(String giveName) {
    name = giveName;
  }

  public void addScore(int amount) {
    score += amount;
  }

  public void drawTiles(int amount) {

  }
}
