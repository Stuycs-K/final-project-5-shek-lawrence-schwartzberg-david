public class MenuScreen {
  private PImage backgroundImage;
  private int screenWidth, screenHeight;
  private int buttonWidth, buttonHeight;
  private Button playButton;
  private Button settingsButton;
  
  
  public MenuScreen() {  
    backgroundImage = loadImage("background.jpg");
    screenWidth = backgroundImage.width;
    screenHeight = backgroundImage.height;
    buttonWidth = 300;
    buttonHeight = 70;
    color playButtonBg = #3D509B;
    color playButtonText = makeBrighter(playButtonBg);
    playButton = new Button(screenWidth / 5, screenHeight / 3, buttonWidth, buttonHeight, playButtonBg, playButtonBg, GRAY, playButtonText, 50, "play", true);  
  }
  
  public void update() {
    playButton.update();
    display();
    if (playButton.isClicked()) {
      game = new Game();
    }
  }
  
  
  public void display() {
    windowResize(screenWidth, screenHeight);
    image(backgroundImage, 0, 0);
    playButton.display();
  }
  
  private color makeBrighter(color c) {
    float multiplier = 2.5;
    float r = min(red(c) * multiplier, 255);
    float g = min(green(c) * multiplier, 255);
    float b = min(blue(c) * multiplier, 255);
    return color(r, g, b);
  }
}
