Board board;
int rotateLeftKey, rotateRightKey, storePieceKey;

void setup() {
  size(1000, 700);
  
  board = new Board(20, 10);
  
  // capital char values are same as their keyCode values in keyPressed()
  rotateLeftKey = 'Z'; // 90
  rotateRightKey = 'X'; // 88
  storePieceKey = 'C'; // 67
}

void draw() {
  board.display(10, 10);
}

void keyPressed(){
  println(keyCode);
}
