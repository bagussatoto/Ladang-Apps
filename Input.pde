void mousePressed() {
  switch (mode) {
    case MENU:
      menuClicks();
      break;
    case GAME:
      gameClicks();
      break;
    case WIN:
      winClicks();
      break;
    case LOSE:
      loseClicks();
      break;
    case OPTIONS:
      optionsClicks();
      break;
    default:
      println(mode + " is not a valid gamemode.");
  }
  
}

void keyPressed() {
  if (key == ' ') {
    mode = Mode.WIN;
  }
}
