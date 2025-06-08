import java.util.*;
import java.io.*;

class Dictionary {
  private ArrayList<String> possibilities;
  private boolean sorted;
  public Dictionary() {
    possibilities = new ArrayList<String>();
  }

  public void reader(String filename) {
    try {
      File file = new File(dataPath(filename));
      Scanner sc = new Scanner(file);
      while (sc.hasNextLine()) {
        possibilities.add(sc.nextLine());
      }
    }
    catch (FileNotFoundException ex) {
      System.out.println("Dictionary not found");
      return;
    }
  }
  private void insertSort() {
    /*for (int x = 1; x < possibilities.size(); x++) {
      String imp = possibilities.get(x);
      int j = x - 1;
      while (j >=0 && possibilities.get(j).compareTo(imp)>0) {
        possibilities.set(j+1, possibilities.get(j));
        j--;
      }
      possibilities.set(j+1, imp);
    }
    */
    Collections.sort(possibilities);
    sorted = true;
  }

  public boolean result(String input) {
    if(!sorted){
      insertSort();
    }
    System.out.println(input);
    int lo = 0;
    int end = possibilities.size() - 1;
    while (lo <= end) {
      int mid = (lo + end) / 2;
      if (input.compareTo(possibilities.get(mid)) < 0) {
        end = mid - 1;
      } else if (input.compareTo(possibilities.get(mid)) > 0) {
        lo = mid + 1;
      } else if(input.compareTo(possibilities.get(mid)) == 0){
        return true;
      }
    }
    return false;
  }
}
