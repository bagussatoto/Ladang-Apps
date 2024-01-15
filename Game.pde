void game() {
  for (Cell[] column: cells) {
    for (Cell c: column) {
      c.display();
    }
  }
}

void gameClicks() {
  int col = (int)((mouseX) / tileSize);
  int row = (int)((mouseY) / tileSize);
  
  if (mouseButton == LEFT) {
    if (!cells[col][row].isFlagged) {
      cells[col][row].flip();
    }
  } else if (mouseButton == RIGHT) {
    cells[col][row].isFlagged = !cells[col][row].isFlagged;
  }
}
