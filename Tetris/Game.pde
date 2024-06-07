public class Game extends Screen {
  int dropSpeed;
  
  private int frame;
  private boolean paused;
  private boolean gameLost;
  private PImage backgroundImage;
  
  private Button continueButton;
  private Button startOverButton;
  private Button menuButton;
  
  private Button startOverButton2;
  private Button menuButton2;
  

  
  public Game() {
    setWindowSize(1000, 700);
    windowResize(width(), height());
    
    boardX = width/2 - SQUARE_SIZE*5;
    boardY = height/2 - SQUARE_SIZE*10;
    board = new Board(20, 10);

    dropSpeed = 50;    
    frame = 0;
    paused = false;
    gameLost = false;
    backgroundImage = loadImage("gameBackground2.jpg");

    int opacity = 150;
    color buttonColor = color(#7B8CCE, 220);
    color outlineColor = makeBrighter(buttonColor, 1.25);
    color textColor = makeBrighter(buttonColor);
    continueButton = new Button(width/2, height/2 - 100, 400, 100, buttonColor, outlineColor, LIGHT_GRAY, textColor, 50, "Continue Game", true);  
    startOverButton = new Button(width/2, height/2, 400, 100, buttonColor, outlineColor, LIGHT_GRAY, textColor, 50, "Restart Game", true);  
    menuButton = new Button(width/2, height/2 + 100, 400, 100, buttonColor, outlineColor, LIGHT_GRAY, textColor, 50, "Menu", true);
    
    startOverButton2 = new Button(width/2, height/2 - 50, 400, 100, buttonColor, outlineColor, LIGHT_GRAY, textColor, 50, "Restart Game", true);  
    menuButton2 = new Button(width/2, height/2 + 50, 400, 100, buttonColor, outlineColor, LIGHT_GRAY, textColor, 50, "Menu", true);
}

  public void run() {
    if (paused) {
      continueButton.update();
      continueButton.display();
      startOverButton.update();
      startOverButton.display();
      menuButton.update();
      menuButton.display();
      if (continueButton.isClicked()) {
        paused = false;
      }
      if (startOverButton.isClicked()) {
        game = new Game();
      }
      if (menuButton.isClicked()) {
        setActive(false);
        menu.setActive(true);
      }
    } else if (gameLost) {
      startOverButton2.update();
      startOverButton2.display();
      menuButton2.update();
      menuButton2.display();
      if (startOverButton2.isClicked()) {
        game = new Game();
      }
      if (menuButton2.isClicked()) {
        setActive(false);
        menu.setActive(true);
      }
    } else {
      board.decrementPieceCountdown();
      if (frame == dropSpeed-1) {
        board.softDrop();
      }
      gameLost = board.checkIfLost();   
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
  
  public boolean isLost() {
    return gameLost;
  }
  
  public void setPause(boolean status) {
    paused = status;
  }
  
}
