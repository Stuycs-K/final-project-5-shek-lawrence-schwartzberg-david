public class Game {
  private static final int screenWidth = 1000;
  private static final int screenHeight = 700;
  private boolean active;
  private boolean paused;

  
  public Game() {
    windowResize(screenWidth, screenHeight);
    board = new Board(20, 10);
    boardX = width/2 - SQUARE_SIZE*5;
    boardY = height/2 - SQUARE_SIZE*10;
    dropSpeed = 50;    
    inputTimer = 0;
    active = true;
    paused = false;
  }

  public void run() {
    display();
    if (paused) {
      startOverButton.update();
      startOverButton.display();
      menuButton.update();
      menuButton.display();
      if (startOverButton.isClicked()) {
        game = new Game();
      }
      if (menuButton.isClicked()) {
        active = false;
      }
    }
    else {
      board.decrementPieceCountdown();
      if (frame == dropSpeed-1) {
        board.softDrop();
      }
      paused = board.checkIfLost();   
      frame = (frame+1)%dropSpeed;
    }
  }
  
  public void display() {
    board.display(boardX, boardY);
    board.displayShadow();
    board.displayCurrentPiece();
    board.displayHeldPiece();
    board.displayNextPieces();
    board.displayScore(boardX - SQUARE_SIZE*2.5, boardY + SQUARE_SIZE*5.2);
  }
  
  public boolean isActive() {
    return active;
  }
  
  public boolean isPaused() {
    return paused;
  }
  
  public void setActive(boolean status) {
    active = status;
  }
  
  public void setPause(boolean status) {
    paused = status;
  }
}
