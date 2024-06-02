public class MenuScreen {
  private int screenWidth, screenHeight;
  private PImage backgroundImage;
  private Button playButton;
  private Button settingsButton;
  
  
  public MenuScreen() {  
    backgroundImage = loadImage("background.jpg");
    screenWidth = backgroundImage.width;
    screenHeight = backgroundImage.height;
    playButton = new Button(screenWidth / 2, screenHeight / 2 + 50, 400, 100, WHITE, BLACK, GRAY, BLACK, 50, "play", true);

    
}
  
  
  public void update() {
    playButton.update();
    display();
    if (playButton.isClicked()) {
      println("test");
      game = new Game();
    }
  }
  
  
  public void display() {
    windowResize(screenWidth, screenHeight);
    image(backgroundImage, 0, 0);
    playButton.display();
  }
}
