public class Tile{]
    Char letter;
    int letterValue;

    public tile(char assignLetter) {
      letter = assignLetter;
      if (letter == 'A' || letter == 'E' || letter == 'I'|| letter == 'O'|| letter == 'U'|| letter == 'L'|| letter == 'N'|| letter == 'S'|| letter == 'T'|| letter == 'R') {
        letterValue = 1;
      }
      else if (letter == 'D'|| letter == 'G') {
        letterValue = 2;
      }
      else if (letter == 'B' || letter == 'C' || letter == 'M' || letter == 'P') {
        letterValue = 3;
      }
      else if (letter == 'F' || letter == 'H' || letter == 'V' || letter == 'W' || letter == 'Y') {
        letterValue = 4;
      }
      else if (letter = 'K') {
        letterValue = 5;
      }
      else if (letter = 'J' || letter = 'X') {
        letterValue = 8;
      }
      else {
        letterValue = 10;
      }
    }
}
