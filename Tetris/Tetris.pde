//import java.util.*;

int SQUARE_SIZE = 30;
color CYAN = #00ffee;
color RED = #ff1500;
color BLUE = #0040ff;
color GREEN = #10c443;
color ORANGE = #ff8c00;
color YELLOW = #ffee00;
color PURPLE = #b700ff;
color GRAY = color(140);


Board board;
float boardX, boardY;

int dropSpeed;
int frame;

Controller controller;

void setup() {
  size(1000, 700);
  
  boardX = width/2 - SQUARE_SIZE*5;
  boardY = height/2 - SQUARE_SIZE*10;
  board = new Board(20, 10);
  
  // starts at 1 second
  dropSpeed = 60;
  
  controller = new Controller();
}

void draw() {
  background(255);
  board.display(boardX, boardY);
  board.displayCurrentPiece();
  
  // moves the piece down 
  if (frame == dropSpeed-1) {
    board.tick();
  }
  
  frame = (frame+1) % dropSpeed;
}

void keyPressed(){
  controller.keyPressed();
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
