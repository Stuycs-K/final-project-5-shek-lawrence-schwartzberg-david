public class Game {
  private boolean active;
  
  public Game() {
    board = new Board(20, 10);
    boardX = width/2 - SQUARE_SIZE*5;
    boardY = height/2 - SQUARE_SIZE*10;
    // starts at 1 second
    dropSpeed = 50;
    
    inputTimer = 0;
    
    
    active = true;
  }
  
  public void display() {
    board.display(boardX, boardY);
    board.displayShadow();
    board.displayCurrentPiece();
    board.displayHeldPiece();
    board.displayNextPieces();
    board.displayScore(boardX - SQUARE_SIZE*2.5, boardY + SQUARE_SIZE*5.2);
  }

  public void run() {
    board.decrementPieceCountdown();
    if (frame == dropSpeed-1) {
      board.softDrop();
    }
    active = !board.checkIfLost();   
    frame = (frame+1)%dropSpeed;

  }
  
  public boolean isActive() {
    return active;
  }
  
  public void setActive(boolean status) {
    active = status;
  }
}
