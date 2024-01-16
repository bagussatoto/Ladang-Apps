import processing.sound.*;

SoundFile background;
SoundFile Explode;

enum Mode {MENU, GAME, WIN, LOSE, OPTIONS};

Mode mode;

int rows;
int cols;
Cell[][] cells;

int bombs;
ArrayList<PVector> bombIndexes;

int tilesLeft;

int tileSize;

int winFrame;
int loseFrame;

color[] numColours = {#000000, #2E35B4, #14762A, #EA1515, #8F22C6, #a28427, #00FFFF, #000000, #000000, #000000};

ArrayList<ButtonShell> menuButtons, winButtons, loseButtons;

void setup() {
  
  background = new SoundFile(this, "Sound/FantasyWav.wav");
  Explode = new SoundFile(this, "Sound/explodify.wav");
  Explode.amp(0.5);
  background.amp(0.5);
  background.play();
  
  //GameOver.play();
  
  size(600, 600, P2D);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  
  setupButtons();
  
  mode = Mode.MENU;
}

void draw() {
  switch (mode) {
    case MENU:
      menu();
      break;
    case GAME:
      game();
      break;
    case WIN:
      win();
      break;
    case LOSE:
      lose();
      break;
    case OPTIONS:
      options();
      break;
    default:
      println(mode + " is not a valid gamemode.");
  }
}
