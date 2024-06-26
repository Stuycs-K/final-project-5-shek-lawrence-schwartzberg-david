public class Menu extends Screen {
  private PImage backgroundImage;
  private PImage tetrisLogo;
  Button playButton;
  Button configButton;
  private int buttonWidth, buttonHeight;
  
  public Menu() {  
    backgroundImage = loadImage("images/menuBackground.png");
    tetrisLogo = loadImage("images/tetris-logo.png");
    setWindowSize(backgroundImage.width, backgroundImage.height);
    buttonWidth = 300;
    buttonHeight = 70;
    color playButtonBg = #653D9B;
    color playButtonHighlight = makeBrighter(playButtonBg, 1.6);
    color playButtonText = makeBrighter(playButtonBg);
    playButton = new Button(width() / 2 - 200, height() - 100, buttonWidth, buttonHeight, playButtonBg, playButtonBg, playButtonHighlight, playButtonText, 50, "Play", true);  
    
    color configButtonBg = #3D509B;
    color configButtonHighlight = makeBrighter(configButtonBg, 1.6);
    color configButtonText = makeBrighter(configButtonBg);
    configButton = new Button(width() / 2 + 200, height() - 100, buttonWidth, buttonHeight, configButtonBg, configButtonBg, configButtonHighlight, configButtonText, 50, "Settings", true);  
  }
  
  
  public void display() {
    windowResize(width(), height());
    
    displayMenuScreenBackgroundImage();
    displayTetrisLogo();
    
    playButton.update();
    configButton.update();
    playButton.display();
    configButton.display();
    
    if (playButton.isClicked()) {
      game = new Game();
      setActive(false);
    }
    if (configButton.isClicked()) {
      this.setActive(false);
      config.setActive(true);
      
    }
  }
}
