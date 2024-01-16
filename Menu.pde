void menu() {
  background(#DC18EA);

  fill(255);
  textSize(75);
  text("LADANG BOM!", width/2, height*2/5);
  
  for (ButtonShell b: menuButtons) {
    b.display();
  }
}

void menuClicks() {
  for (ButtonShell b: menuButtons) {
    b.checkClick();
  }
}
