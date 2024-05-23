public class Controller {
  int rotateLeftKey, rotateRightKey, storePieceKey;
  
  public Controller() {
    // capital char values are same as their keyCode values in keyPressed()
    rotateLeftKey = 'Z'; // 90
    rotateRightKey = 'X'; // 88
    storePieceKey = 'C'; // 67
  }
  
  void keyPressed(){
    println(keyCode);
  }
}
