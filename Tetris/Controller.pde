public class Controller {
  int rotateLeftKey, rotateRightKey, storePieceKey, SPACE;
  boolean[] keyPressedArray;
  // 0-left, 1-right, 2-down, 3-space, 4-rotateLeft, 5-rotateRight
  
  public Controller() {
    // capital char values are same as their keyCode values in keyPressed()
    rotateLeftKey = 'Z'; // 90
    rotateRightKey = 'X'; // 88
    storePieceKey = 'C'; // 67
    SPACE = 32;
    
    keyPressedArray = new boolean[6];
  }

  public void press(int code, boolean flag){
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
    }
    
    if (code == rotateLeftKey) {
      set(4, flag);
    }
    
    if (code == rotateRightKey) {
      set(5, flag);
    }
    
  }
  
  private void set(int type, boolean flag) {
    keyPressedArray[type] = flag;
  }
  
  // 0-left, 1-right, 2-down, 3-space, 4-rotateLeft, 5-rotateRight
  public void pressKeys() {
    if (countdown != 0) {
      return;
    }
    countdown += delay;
    if (keyPressedArray[0]) {
      board.movePieceLeft();
    }
    
    if (keyPressedArray[1]) {
      board.movePieceRight();
    }
    
    if (keyPressedArray[2]) {
      board.softDrop();
    }
    
    if (keyPressedArray[3]) {
      board.hardDrop();
    }
    
    if (keyPressedArray[4]) {
      board.rotatePieceLeft();
      countdown += delay;
    }
    
    if (keyPressedArray[5]) {
      board.rotatePieceRight();
      countdown += delay;
    }
  }
  
}
