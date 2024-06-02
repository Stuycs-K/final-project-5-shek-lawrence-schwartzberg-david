int SQUARE_SIZE = 30;

color CYAN = #00E6E6;
color RED = #E64A53;
color BLUE = #1856ED;
color GREEN = #10c443;
color ORANGE = #ff8c00;
color YELLOW = #E6DC45;
color PURPLE = #A500FF;

//color GRAY = #8c8c8c;
color OUTLINE = #1B1B1B;
color GRAY = #4D4C4F;
color BLACK = #000000;
color WHITE = #ffffff;

MenuScreen menu;

Board board;
float boardX, boardY;

int dropSpeed;
int frame;
int inputTimer;

// input delay
int countdown;
int delay = 6;

Game game;

Controller controller;
Button startOverButton;
Button menuButton;

void setup() {
  controller = new Controller();
  game = new Game();
  game.setActive(false);
  countdown = 0;

  startOverButton = new Button(width/2, height/2 - 50, 400, 100, WHITE, BLACK, GRAY, BLACK, 50, "RESTART GAME", true);
  menuButton = new Button(width / 2, height / 2 + 50, 400, 100, WHITE, BLACK, GRAY, BLACK, 50, "menu", true);
  menu = new MenuScreen();
}

void draw() {
  background(WHITE);
  debug(); // remove in final
  if (countdown > 0) {
    countdown--;
  }
  controller.pressKeys();
  if (game.isActive()) {
    game.display();
    game.run();
  }
  else {
    menu.update();
  }
}

void debug() {
  fill(BLACK);
  textSize(10);
  textAlign(LEFT, TOP);
  text("rotateLeftKey: " + (char)controller.rotateLeftKey, 10, 10);
  text("rotateRightKey: " + (char)controller.rotateRightKey, 10, 30);
  text("storePieceKey: " + (char)controller.storePieceKey, 10, 50);
  text("dropSpeed: " + dropSpeed, 10, 70);
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
