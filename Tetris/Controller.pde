public class Controller {
  int[] keyCodes;
  boolean[] keyPressedArray;
  // 0-left, 1-right, 2-softdrop, 3-harddrop, 4-rotateLeft, 5-rotateRight, 6-storePiece, 7-pause
  
  // holding hardDrop doesn't do it multiple times
  boolean canHardDrop;
  
  public Controller() {
    keyCodes = new int[] {37, 39, 40, 32, 'Z', 'X', 'C', 'P'};
    keyPressedArray = new boolean[8];
    
    canHardDrop = true;
  }

  public void press(int code, boolean flag){
    if (game.isActive() && !game.isPaused() && !game.isLost()) {
      for (int i = 0; i < keyCodes.length; i++) {
        if (code == keyCodes[i]) {
          setKeyToBePressed(i, flag);
          
          // harddrop
          // if it was being held down and is now released, allow hard drops again
          if (code == keyCodes[3] && !canHardDrop && !flag) {
            canHardDrop = true;
          }
        }
      }
     
    } else {
      for (int i = 0; i < keyCodes.length; i++) {
          setKeyToBePressed(i, false);
      }
    }

    if (!board.checkIfLost() && code == keyCodes[7]) {
      setKeyToBePressed(7, flag);
    }
  }
  
  private void setKeyToBePressed(int type, boolean flag) {
    keyPressedArray[type] = flag;
  }
  
  public boolean setNewKeyCode(int whichKey, int newKeyCode) {
    for (int i = 0; i < keyCodes.length; i++) {
      if (i != whichKey && newKeyCode == keyCodes[i]) {
        return false;
      }
    }
    
    keyCodes[whichKey] = newKeyCode;
    return true;
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
    
    // softdrop
    if (keyPressedArray[2]) {
      board.softDrop();
    }
    
    // harddrop
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
