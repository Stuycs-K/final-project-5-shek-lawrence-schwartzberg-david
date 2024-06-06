public class Config extends Screen {
  private PImage backgroundImage;
  private int buttonWidth, buttonHeight;
  private Button returnButton;
  
  public Config() {
      backgroundImage = loadImage("menuBackground2.png");
      setWindowSize(backgroundImage.width, backgroundImage.height);
      buttonWidth = 120;
      buttonHeight = 40;
      color returnButtonBg = #653D9B;
      color returnButtonText = makeBrighter(returnButtonBg);
      returnButton = new Button(width() - 80, height() - 30, buttonWidth, buttonHeight, returnButtonBg, returnButtonBg, LIGHT_GRAY, returnButtonText, 20, "go back", true);  
  }
  
  public void update() {
    returnButton.update();
    if (returnButton.isClicked()) {
      setActive(false);
      menu.setActive(true);
    }
  }
  
  public void display() {
    image(backgroundImage, 0, -100);
    image(backgroundImage, 0, backgroundImage.height - 100);
    update();
    returnButton.display();
  }
}
