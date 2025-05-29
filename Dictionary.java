import java.util.*;
import java.io.*;

public class Dictionary{
    private ArrayList<String> possibilities = new ArrayList<String>();

    public void reader(String name){
        try{
            File file = new File(name);
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
        int end = possibilities.size();
        int mid = possibilities.size() / 2;
        while(lo <= end){
            if(input.compareTo(possibilities.get(mid)) < 0){
                end = possibilities.size() / 2;
            } else if(input.compareTo(possibilities.get(mid)) > 0){
                lo = (possibilities.size() /2) + 1;
            } else{
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args){
        
    }
}
