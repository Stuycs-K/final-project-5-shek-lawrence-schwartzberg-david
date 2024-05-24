public class Controller {
  int rotateLeftKey, rotateRightKey, storePieceKey;
  int downArrow, upArrow;
  
  public Controller() {
    // capital char values are same as their keyCode values in keyPressed()
    rotateLeftKey = 'Z'; // 90
    rotateRightKey = 'X'; // 88
    storePieceKey = 'C'; // 67
    
    downArrow = 40;
    upArrow = 38;
    
  }
  
  void keyPressed(){
    if (keyCode == downArrow) {
      board.tick();
    }
    if (keyCode == LEFT) {
      board.movePieceLeft();
    }
    if (keyCode == RIGHT) {
      board.movePieceRight();
    }
  }
  
}
