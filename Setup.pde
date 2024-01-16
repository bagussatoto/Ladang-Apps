void setupBoard() {
  cells = new Cell[cols][rows];
  bombIndexes = new ArrayList<PVector>();
  
  for (int i = 0; i < bombs; i++) {
    PVector index;
    int x;
    int y;
    do {
      x = (int)random(cols);
      y = (int)random(rows);
      index = new PVector(x, y);
    } while (bombIndexes.contains(index) || (x > (float)cols*2f/10f && x < (float)cols*7f/10f && y > (float)rows*2f/10f && y < (float)rows*7f/10f));
    
    bombIndexes.add(index);
  }
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      PVector pos = new PVector(i, j);
      boolean isBomb = bombIndexes.contains(pos);
      Cell c = new Cell(tileSize/2 + i*tileSize, tileSize/2 + j*tileSize, i, j, isBomb);
      
      cells[i][j] = c;
    }
  }
  
  for (Cell[] column: cells) {
    for (Cell c: column) {
      if (!c.isBomb) c.findBombsNear();
    }
  }
  
  tilesLeft = rows * cols;
}

void setupEasy() {
  //Music
  background.stop();
  rows = 10;
  cols = 10;
  tileSize = min(width / cols, height/rows);
  bombs = 12;
  
  setupBoard();
}

void setupMedium() {
  //Music
  background.stop();
  rows = 15;
  cols = 15;
  tileSize = min(width / cols, height/rows);
  bombs = 27;
  
  setupBoard();
}

void setupHard() {
  //Music
  background.stop();
  rows = 20;
  cols = 20;
  tileSize = min(width / cols, height/rows);
  bombs = 50;
  
  setupBoard();
}

void setupButtons() {
  menuButtons = new ArrayList<ButtonShell>();
  winButtons = new ArrayList<ButtonShell>();
  loseButtons = new ArrayList<ButtonShell>();
  
  Executable easy = () -> {setupEasy(); mode = Mode.GAME;};
  Executable medium = () -> {setupMedium(); mode = Mode.GAME;};
  Executable hard = () -> {setupHard(); mode = Mode.GAME;};
  Executable again = () -> {setupBoard(); mode = Mode.GAME;};
  
  menuButtons.add(new RectButton(width/4, height*13/20, width/3, width/6, #FFFFFF, #000000, 10, "MUDAH", easy));
  menuButtons.add(new RectButton(width*3/4, height*13/20, width/3, width/6, #FFFFFF, #000000, 10, "SEDANG", medium));
  menuButtons.add(new RectButton(width/2, height*35/40, width/3, width/6, #FFFFFF, #000000, 10, "SULIT", hard));

  
  winButtons.add(new RectButton(width/2, height*7/10, width/3, width/6, #FFFFFF, #000000, 10, "ULANGI", again));
  loseButtons.add(new RectButton(width/2, height*7/10, width/3, width/6, #FFFFFF, #000000, 10, "ULANGI", again));

}
