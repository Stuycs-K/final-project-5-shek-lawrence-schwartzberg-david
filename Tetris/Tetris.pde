int SQUARE_SIZE = 30;

color CYAN = #00E6E6;
color RED = #E64A53;
color BLUE = #1C62FF;
color GREEN = #16D647;
color ORANGE = #ff8c00;
color YELLOW = #F0E549;
color PURPLE = #B435FA;

color OUTLINE = #1B1B1B;
color GRAY = #4D4C4F;
color LIGHT_GRAY = #A6AEB4;
color BLACK = #000000;
color WHITE = #ffffff;

int inputTimer;

// input delay
int countdown;
int delay = 6;

float boardX, boardY;

Board board;
Game game;
Menu menu;
Config config;
Controller controller;

void setup() {
  controller = new Controller();
  menu = new Menu();
  config = new Config();
  config.setActive(false);
  game = new Game();
  game.setActive(false);
  countdown = 0;
}

void draw() {
  background(WHITE);
  if (countdown > 0) {
    countdown--;
  }
  controller.pressKeys();
  display();
}


void display() {
  if (menu.isActive()) {
    menu.display();
  }
  else if (config.isActive()) {
    config.display();
  }
  else if (game.isActive()) {
    game.display();
    game.run();
  } 
}
 

void keyPressed() {
  controller.press(keyCode, true);
  
  if (config.waitingForKeyPress) {
    config.setKey(keyCode);
  }
  
  if (keyCode == 'Q') {
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

color makeBrighter(color c) {
  float multiplier = 2.5;
  float r = min(red(c) * multiplier, 255);
  float g = min(green(c) * multiplier, 255);
  float b = min(blue(c) * multiplier, 255);
  return color(r, g, b);
}

color makeBrighter(color c, float mult) {
  float r = min(red(c) * mult, 255);
  float g = min(green(c) * mult, 255);
  float b = min(blue(c) * mult, 255);
  return color(r, g, b);
}
