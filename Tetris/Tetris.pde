int SQUARE_SIZE = 20;
color CYAN = #00ffee;
color RED = #ff1500;
color BLUE = #0040ff;
color GREEN = #10c443;
color ORANGE = #ff8c00;
color YELLOW = #ffee00;
color PURPLE = #b700ff;

Board board;
int rotateLeftKey, rotateRightKey, storePieceKey;

TPiece test;

void setup() {
  size(1000, 700);
  
  board = new Board(20, 10);
  
  // capital char values are same as their keyCode values in keyPressed()
  rotateLeftKey = 'Z'; // 90
  rotateRightKey = 'X'; // 88
  storePieceKey = 'C'; // 67
  test = new TPiece('L');
}

void draw() {
  board.display(10, 10);
  test.display(100, 100);
  board.displayPiece(0, 0);
}

void keyPressed(){
  println(keyCode);
}
