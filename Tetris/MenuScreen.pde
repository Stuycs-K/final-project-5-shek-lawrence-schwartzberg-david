public class MenuScreen {
  private PImage backgroundImage;
  private int screenWidth, screenHeight;
  private int buttonWidth, buttonHeight;
  private Button playButton;
  private Button settingsButton;
  
  
  public MenuScreen() {  
     //background 1
    //backgroundImage = loadImage("menuBackground1.jpg");
    // background 2
    backgroundImage = loadImage("menuBackground2.png");
    screenWidth = backgroundImage.width;
    screenHeight = backgroundImage.height;
    buttonWidth = 300;
    buttonHeight = 70;
    color playButtonBg = #3D509B;
    color playButtonText = makeBrighter(playButtonBg);
    //background 1
    //playButton = new Button(screenWidth / 5, screenHeight / 3, buttonWidth, buttonHeight, playButtonBg, playButtonBg, GRAY, playButtonText, 50, "Play", true);  
  
    // background 2
    playButton = new Button(screenWidth / 5, screenHeight / 1.5 , buttonWidth, buttonHeight, playButtonBg, playButtonBg, GRAY, playButtonText, 50, "Play", true);  
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
    // backgound 1
    //image(backgroundImage, 0, 0);
    // background 2
    image(backgroundImage, 0, -100);
    image(backgroundImage, 0, backgroundImage.height - 100);
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
