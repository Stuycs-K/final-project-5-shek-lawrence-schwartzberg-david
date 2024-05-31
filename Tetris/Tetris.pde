//import java.util.*;

int SQUARE_SIZE = 30;

color CYAN = #00ffee;
color RED = #ff1500;
color BLUE = #0040ff;
color GREEN = #10c443;
color ORANGE = #ff8c00;
color YELLOW = #ffee00;
color PURPLE = #b700ff;

color GRAY = #8c8c8c;
color BLACK = #000000;
color WHITE = #ffffff;

MenuScreen menu;

Board board;
float boardX, boardY;

int dropSpeed;
int frame;
int inputTimer;

int countdown;
int delay = 5;

Game game;

Controller controller;
Button startOverButton;

void setup() {
  size(1000, 700);
  

  
  game = new Game();
  
  startOverButton = new Button(width/2, height/2, 400, 100, WHITE, BLACK, GRAY, BLACK, 50, "RESTART GAME", true);
  menu = new MenuScreen(1000, 700);
}

void draw() {
  background(WHITE);
  
  // remove in final
  debug();
  if (game.isActive()) {
    game.run();
  }
  else {
    startOverButton.update();
    startOverButton.display();
    if (startOverButton.isClicked()) {
      game = new Game();
   }
  }
}

void debug() {
  fill(BLACK);
  textSize(10);
  textAlign(LEFT, TOP);
  text("rotateLeftKey: " + (char)controller.rotateLeftKey, 10, 10);
  text("rotateRightKey: " + (char)controller.rotateRightKey, 10, 30);
  text("storePieceKey: " + (char)controller.storePieceKey, 10, 50);
}
  

void keyPressed() {
  controller.press(keyCode, true);
  
  if (keyCode == 'P') {
    board.printStuff();
  }
}

void keyReleased() {
  controller.press(keyCode, false);
}


public TPiece createNewTPiece() {
  int type = (int)(Math.random()*7);
  
  char c = 'I';
  switch(type) {
    case 0:
      c = 'I';
      break;
      
    case 1:
      c = 'J';
      break;
    
    case 2:
      c = 'L';
      break;
      
    case 3:
      c = 'S';
      break;
    
    case 4:
      c = 'Z';
      break;
    
    case 5: 
      c = 'T';
      break;
    
    case 6:
      c = 'O';
      break;
      
    default:
      c = '-';
      break;
  }
  
  return new TPiece(c);
}
      
color getColor(char c) {
  switch (c) {
    case 'I':
      return CYAN;
    case 'J': 
      return BLUE;
    case 'L': 
      return ORANGE;
    case 'S':
      return GREEN;
    case 'Z': 
      return RED;
    case 'O':
      return YELLOW;
    case 'T':
      return PURPLE;
    default:
      return GRAY;
  }
}
