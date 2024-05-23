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
int rotateLeftKey, rotateRightKey, storePieceKey;

void setup() {
  size(1000, 700);
  
  boardX = width/2 - SQUARE_SIZE*5;
  boardY = height/2 - SQUARE_SIZE*10;
  board = new Board(20, 10);
  
  // capital char values are same as their keyCode values in keyPressed()
  rotateLeftKey = 'Z'; // 90
  rotateRightKey = 'X'; // 88
  storePieceKey = 'C'; // 67
}

void draw() {
  board.display(boardX, boardY);
  board.displayCurrentPiece(-1, 0);
}

void keyPressed(){
  println(keyCode);
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
