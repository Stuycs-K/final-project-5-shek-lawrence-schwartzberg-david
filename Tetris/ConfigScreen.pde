public class ConfigScreen {
  private PImage backgroundImage;
  private int screenWidth, screenHeight;
  private int buttonWidth, buttonHeight;
  private Button returnToGameButton;
  
  
  public ConfigScreen() {
    backgroundImage = loadImage("menuBackground2.png");
    backgroundImage = loadImage("menuBackground2.png");
    screenWidth = backgroundImage.width;
    screenHeight = backgroundImage.height;
    windowResize(screenWidth, screenHeight);
    
  }
  
  public void update() {
    ;
  }
  
  public void display() {
     fill(BLACK);
  textSize(10);
  textAlign(LEFT, TOP);
  text("rotateLeftKey: " + (char)controller.rotateLeftKey, 10, 10);
  text("rotateRightKey: " + (char)controller.rotateRightKey, 10, 30);
  text("storePieceKey: " + (char)controller.storePieceKey, 10, 50);
  text("dropSpeed: " + dropSpeed, 10, 70);
  }
}
