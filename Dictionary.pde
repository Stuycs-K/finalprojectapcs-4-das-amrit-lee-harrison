import java.util.*;
import java.io.*;

 class Dictionary{
    private ArrayList<String> possibilities;
    
    public Dictionary(){
      possibilities = new ArrayList<String>();
    }
    
    public void reader(String name){
        try{
            File file = new File(dataPath(name));
            Scanner sc = new Scanner(file);
            while(sc.hasNextLine()){
                possibilities.add(sc.nextLine());
            }
        } catch (FileNotFoundException ex){
            System.out.println("Dictionary not found");
            return;
        }
    }

    public boolean result(String input){
        int lo = 0;
        int end = possibilities.size() - 1;
        while(lo <= end){
            int mid = (lo + end) / 2;
            if(input.compareTo(possibilities.get(mid)) < 0){
                end = mid - 1;
            } else if(input.compareTo(possibilities.get(mid)) > 0){
                lo = mid + 1;
            } else{
                return true;
            }
        }
        return false;
    }

}
