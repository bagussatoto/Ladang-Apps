class Cell {
  int x;
  int y;
  int col;
  int row;
  int bombsNear;
  
  boolean isBomb;
  
  boolean isFlipped;
  boolean isFlagged;
  
  color fillColour;
  color innerColour;
  
  Cell(int _x, int _y, int _col, int _row, boolean _isBomb) {
    x = _x;
    y = _y;
    col = _col;
    row = _row;
    isBomb = _isBomb;
    
    isFlipped = false;
    
    if (isBomb) {
      colorMode(HSB);
      fillColour = color(random(255), 255, 255);
      innerColour = color(hue(fillColour), 255, 175);
      colorMode(RGB);
    }
  }
  
  void findBombsNear() {
    bombsNear = 0;
    
    for (int i = -1; i < 2; i++) {
      for (int j = -1; j < 2; j++) {
        if (col + i >= 0 && col + i < cols && row + j >= 0 && row + j < rows) {
          if (cells[col + i][row + j].isBomb) {
            bombsNear++;
          }
        }
      }
    }
  }
  
  void display() {
    if (isFlipped) {
      if (!isBomb) {    
        if ((col + row) % 2 == 0) {
          fill(#E8DEAB);
        } else {
           
          fill(#C4BB90);
        }
        
        noStroke();
        square(x, y, tileSize);
        
        if (bombsNear > 0) {
          fill(numColours[bombsNear]);
          //fill(0);
          textSize(tileSize*2/3);
          text(bombsNear + "", x, y);
        }
      } else {
        ///colorMode(HSB);
        fill(fillColour);
        noStroke();
        square(x, y, tileSize);
        
        fill(innerColour);
        circle(x, y, tileSize/2);
      }
    } else {
      if ((col + row) % 2 == 0) {
        fill(#41DE54);
      } else {
        fill(#39C44A);
      }
      
      noStroke();
      square(x, y, tileSize);
      
      if (isFlagged) {
        stroke(255, 0, 0);
        strokeWeight(4);
        line(x - tileSize/4, y - tileSize*2/5, x - tileSize/4, y + tileSize*2/5);
            
        fill(255, 0, 0);
        noStroke();
        triangle(x - tileSize/4, y - tileSize*13/30, x + tileSize*19/60, y - tileSize*2/15, x - tileSize/4, y + tileSize*3/20);
      }
    }
  }
  
  
  void flip() {
    isFlipped = true;
    tilesLeft--;
    
    //mode = Mode.WIN;
    if (isBomb) {
      //bomb sound
      Explode.play();
      display();
      mode = Mode.LOSE;
      loseFrame = 0;
      return;
    }
    
    if (tilesLeft == bombs) {
      display();
      mode = Mode.WIN;
      winFrame = frameCount;
      return;
    }
    
    if (bombsNear == 0) {
      for (int i = -1; i < 2; i++) {
        for (int j = -1; j < 2; j++) {
          if (i == 0 && j == 0) continue;
          if (col + i >= 0 && col + i < cols && row + j >= 0 && row + j < rows) {
            if (!cells[col + i][row + j].isFlipped) {
              cells[col + i][row + j].flip();
            }
          }
        }
      }
    }
  }
}
