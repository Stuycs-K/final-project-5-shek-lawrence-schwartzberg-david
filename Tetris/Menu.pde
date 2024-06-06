public class Menu extends Screen {
  private PImage backgroundImage;
  Button playButton;
  Button configButton;
  private int buttonWidth, buttonHeight;
  
  public Menu() {  
    backgroundImage = loadImage("menuBackground2.png");
    setWindowSize(backgroundImage.width, backgroundImage.height);
    buttonWidth = 300;
    buttonHeight = 70;
    color playButtonBg = #653D9B;
    color playButtonText = makeBrighter(playButtonBg);
    playButton = new Button(width() / 4, height() / 1.5 , buttonWidth, buttonHeight, playButtonBg, playButtonBg, LIGHT_GRAY, playButtonText, 50, "Play", true);  
    
    color configButtonBg = #3D509B;
    color configButtonText = makeBrighter(configButtonBg);
    configButton = new Button(width() / 4 * 3, height() / 1.5, buttonWidth, buttonHeight, configButtonBg, configButtonBg, LIGHT_GRAY, configButtonText, 50, "Settings", true);  
  }
  
  
  public void display() {
    windowResize(width(), height());
    image(backgroundImage, 0, -100);
    image(backgroundImage, 0, backgroundImage.height - 100);
    
    playButton.update();
    configButton.update();
    playButton.display();
    configButton.display();
    
    if (playButton.isClicked()) {
      game = new Game();
      setActive(false);
    }
    if (configButton.isClicked()) {
      setActive(false);
      config.setActive(true);
    }
  }
}
