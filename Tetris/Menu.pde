public class Menu extends Screen {
  private PImage backgroundImage;
  private int buttonWidth, buttonHeight;
  private Button playButton;
  private Button configButton;
  
  
  public Menu() {  
    // background 2
    backgroundImage = loadImage("menuBackground2.png");
    setWindowSize(backgroundImage.width, backgroundImage.height);
    buttonWidth = 300;
    buttonHeight = 70;
    color playButtonBg = #653D9B;
    color playButtonText = makeBrighter(playButtonBg);
    playButton = new Button(width() / 5, height() / 1.5 , buttonWidth, buttonHeight, playButtonBg, playButtonBg, LIGHT_GRAY, playButtonText, 50, "Play", true);  
    
    color configButtonBg = #3D509B;
    color configButtonText = makeBrighter(configButtonBg);
    configButton = new Button(width() / 5 + buttonWidth * 1.3, height() / 1.5, buttonWidth, buttonHeight, configButtonBg, configButtonBg, LIGHT_GRAY, configButtonText, 50, "Settings", true);  
  }
  
  public void update() {
    playButton.update();
    configButton.update();
    if (playButton.isClicked()) {
      game = new Game();
      setActive(false);
    }
    if (configButton.isClicked()) {
      setActive(false);
      config.setActive(true);
    }
  }
  
  
  public void display() {
    windowResize(width(), height());
    update();
    // background 2
    image(backgroundImage, 0, -100);
    image(backgroundImage, 0, backgroundImage.height - 100);
    playButton.display();
    configButton.display();
  }
}
