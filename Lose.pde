void lose() {
  if (loseFrame/4 < cols * rows) {
    Cell c = cells[loseFrame/4 % cols][loseFrame/4 / cols];
    if (c.isBomb) {
      c.isFlipped = true;
      c.display();
  }
    loseFrame++;
  } 
  
  else {
    noStroke();
    fill(red(#5EC4E8), green(#5EC4E8), blue(#5EC4E8), 20);
    rect(width/2, height/2, width, height);
     
    fill(#DC18EA);//#258947
    rect(width/2, height/2, width*3/4, height*3/4);
    
    fill(255);
    textSize(70);
    text("KAMU KALAH!", width/2, height*2/5);
    
    for (ButtonShell b: loseButtons) {
      b.display();
      break;
    }
  }
  
  
}

void loseClicks() {
  for (ButtonShell b: loseButtons) {
    b.checkClick();
  }
}
