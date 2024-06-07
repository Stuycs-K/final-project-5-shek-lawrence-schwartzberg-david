public class Game extends Screen {
  int dropSpeed;
  int frame;
  
  private boolean paused;
  private PImage backgroundImage;
  private Button startOverButton;
  private Button menuButton;
  

  
  public Game() {
    setWindowSize(1000, 700);
    windowResize(width(), height());
    
    boardX = width/2 - SQUARE_SIZE*5;
    boardY = height/2 - SQUARE_SIZE*10;
    board = new Board(20, 10);

    dropSpeed = 50;    
    frame = 0;
    inputTimer = 0;
    paused = false;
    backgroundImage = loadImage("gameBackground2.jpg");

    startOverButton = new Button(width/2, height/2 - 50, 400, 100, WHITE, BLACK, LIGHT_GRAY, BLACK, 50, "Restart Game", true);  
    menuButton = new Button(width/2, height/2 + 50, 400, 100, WHITE, BLACK, LIGHT_GRAY, BLACK, 50, "Menu", true);
}

  public void run() {
    if (paused) {
      startOverButton.update();
      startOverButton.display();
      menuButton.update();
      menuButton.display();
      if (startOverButton.isClicked()) {
        game = new Game();
      }
      if (menuButton.isClicked()) {
        setActive(false);
        menu.setActive(true);
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
    image(backgroundImage, 0, 0);
    image(backgroundImage, backgroundImage.width, 0);
    image(backgroundImage, 0, backgroundImage.height);
    image(backgroundImage, backgroundImage.width, backgroundImage.height);
    board.display(boardX, boardY);
    board.displayShadow();
    board.displayCurrentPiece();
    board.displayHeldPiece();
    board.displayNextPieces();
    board.displayScore(boardX - SQUARE_SIZE*2.5, boardY + SQUARE_SIZE*5.2);
  }
  
  
  public boolean isPaused() {
    return paused;
  }
  
  public void setPause(boolean status) {
    paused = status;
  }
}
