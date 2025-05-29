import java.util.*;
import java.io.*;

void setup(){
  for(int x = 0; x < displayWidth; x += (displayWidth/15)){
    for(int y = 0; y < displayheight; y+= (displayHeight/15)){
      fill(255);
      square(x,y);
    }
  }
  
  
