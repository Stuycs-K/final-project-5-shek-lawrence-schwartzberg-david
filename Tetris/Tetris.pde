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

// input delay
int countdown;
int delay = 6;

float boardX, boardY;
int startLevel = 0;

Board board;
Game game;
Menu menu;
Config config;
Controller controller;

PImage menuScreenBackgroundImage;
PImage tetrisLogo;

void setup() {
  menuScreenBackgroundImage = loadImage("images/menuBackground.png");
  tetrisLogo = loadImage("images/tetris-logo.png");
  
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
  } else if (config.isActive()) {
    config.display();
  } else if (game.isActive()) {
    game.display();
    game.run();
  } 
} 

void keyPressed() {
  controller.press(keyCode, true);
  
  if (config.waitingForKeyPress) {
    config.setKey(keyCode);
  }
  
  if (config.waitingForLevelSelect) {
    config.setLevel(keyCode);
  }
  
}

void keyReleased() {
  controller.press(keyCode, false);
}

void displayMenuScreenBackgroundImage() {
  image(menuScreenBackgroundImage, 0, height - menuScreenBackgroundImage.height);
}

void displayTetrisLogo() {
  float scale = 3;
  image(tetrisLogo, width/2 - 217, 40, width/(scale*0.65), height/scale);
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

color makeBrighter(color c, float mult) {
  float r = min(red(c) * mult, 255);
  float g = min(green(c) * mult, 255);
  float b = min(blue(c) * mult, 255);
  return color(r, g, b);
}

color makeBrighter(color c) {
  return makeBrighter(c, 2.5);
}
