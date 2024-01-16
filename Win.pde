void win() {
  noStroke();
  fill(red(#5EC4E8), green(#5EC4E8), blue(#5EC4E8), 20);
  rect(width/2, height/2, width, height);
  
  fill(#DC18EA);
  rect(width/2, height/2, width*3/4, height*3/4);
  
  fill(255);
  textSize(80);
  text("MENANG!", width/2, height*2/5);
  
  for (ButtonShell b: winButtons) {
    b.display();
  }
}

void winClicks() {
  for (ButtonShell b: winButtons) {
    b.checkClick();
  }
}
