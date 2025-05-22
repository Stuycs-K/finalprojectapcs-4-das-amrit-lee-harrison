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
    }
}
