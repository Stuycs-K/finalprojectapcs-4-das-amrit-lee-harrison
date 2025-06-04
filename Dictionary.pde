import java.util.*;
import java.io.*;

class Dictionary {
  private ArrayList<String> possibilities;
  private String[] pos;

  public Dictionary() {
    possibilities = new ArrayList<String>();
    /*
      pos = loadStrings("Dict.txt");
     for(int x = 1; x < pos.length;x++){
     String imp = pos[x];
     int j = x - 1;
     while(j >=0 && pos[j].compareTo(imp)>0){
     pos[j +1] = pos[j];
     j--;
     }
     pos[j + 1] = imp;
     }
     */
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

  public boolean result(String input) {
    for (int x = 1; x < possibilities.size(); x++) {
      String imp = possibilities.get(x);
      int j = x - 1;
      while (j >=0 && possibilities.get(j).compareTo(imp)>0) {
        possibilities.set(j+1, possibilities.get(j));
        j--;
      }
      possibilities.set(j+1, imp);
    }

    int lo = 0;
    int end = possibilities.size() - 1;
    while (lo <= end) {
      int mid = (lo + end) / 2;
      if (input.compareTo(possibilities.get(mid)) < 0) {
        end = mid - 1;
      } else if (input.compareTo(possibilities.get(mid)) > 0) {
        lo = mid + 1;
      } else {
        return true;
      }
    }
    return false;
  }
  /*
   public boolean result(String input){
   
   int lo = 0;
   int end = pos.length - 1;
   while(lo <= end){
   int mid = (lo + end) / 2;
   if(input.compareTo(pos[mid]) < 0){
   end = mid - 1;
   } else if(input.compareTo(pos[mid]) > 0){
   lo = mid + 1;
   } else{
   return true;
   }
   }
   return false;
   }
   */
}
