public class Controller {
  int rotateLeftKey, rotateRightKey, storePieceKey, SPACE, pauseKey;
  boolean[] keyPressedArray;
  // 0-left, 1-right, 2-down, 3-space, 4-rotateLeft, 5-rotateRight, 6-storePiece, 7-pause
  
  // holding hardDrop doesn't do it multiple times
  boolean canHardDrop;
  
  public Controller() {
    // capital char values are same as their keyCode values in keyPressed()
    rotateLeftKey = 'Z'; // 90
    rotateRightKey = 'X'; // 88
    storePieceKey = 'C'; // 67
    pauseKey = 'P';
    SPACE = 32;
    
    keyPressedArray = new boolean[8];
    canHardDrop = true;
  }

  public void press(int code, boolean flag){
    if (game.isActive() && !game.isPaused()) {
      if (code == LEFT) {
        set(0, flag);
      }
      
      if (code == RIGHT) {
        set(1, flag);
      }
      
      if (code == DOWN) {
        set(2, flag);
      }
      
      if (code == SPACE) {
        set(3, flag);
        // if it was being held down and is now released, allow hard drops again
        if (!canHardDrop && !flag) {
          canHardDrop = true;
        }
      }
      
      if (code == rotateLeftKey) {
        set(4, flag);
      }
      
      if (code == rotateRightKey) {
        set(5, flag);
      }
      
      if (code == storePieceKey) {
        set(6, flag);
      }
    }
    else {
      for (int i = 0; i < keyPressedArray.length; i++) {
          set(i, false);
      }
    }

    if (!board.checkIfLost() && code == pauseKey) {
      set(7, flag);

    }
  }
  
  private void set(int type, boolean flag) {
    keyPressedArray[type] = flag;
  }
  
  // 0-left, 1-right, 2-down, 3-space, 4-rotateLeft, 5-rotateRight, 6-storePiece
  public void pressKeys() {
    if (countdown != 0) {
      return;
    }
    
    countdown += delay;
    
    // left
    if (keyPressedArray[0]) {
      board.movePieceLeft();
    }
    
    // right
    if (keyPressedArray[1]) {
      board.movePieceRight();
    }
    
    // down
    if (keyPressedArray[2]) {
      board.softDrop();
    }
    
    // space
    if (keyPressedArray[3] && canHardDrop) {
      board.hardDrop();
      countdown += delay;
      // set to false, changed back when hardDrop is released
      canHardDrop = false; 
    }
    
    // rotateLeft
    if (keyPressedArray[4]) {
      board.rotatePieceLeft();
      countdown += delay;
    }
    
    // rotateRight
    if (keyPressedArray[5]) {
      board.rotatePieceRight();
      countdown += delay;
    }
    
    // storePiece
    if (keyPressedArray[6]) {
      board.switchPiece();
      countdown += delay;
    }
    
    // pause game
    if (keyPressedArray[7]) {
      game.setPause(!game.isPaused());
      countdown += delay;
    }
  }
  
}
