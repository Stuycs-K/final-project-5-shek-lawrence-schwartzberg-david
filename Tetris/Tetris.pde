Board board;

void setup() {
  size(1000, 700);
  board = new Board(20, 10);
  
  board.display(10, 10);
}

void draw() {
}

void keyPressed(){
  println(keyCode);
}
