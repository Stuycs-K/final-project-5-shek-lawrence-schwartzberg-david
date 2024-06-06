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
      returnButton = new Button(width() - 80, height() - 30, buttonWidth, buttonHeight, returnButtonBg, returnButtonBg, LIGHT_GRAY, returnButtonText, 20, "Main Menu", true);  
      
      int numButtons = 5;
      int leftBound = 100;
      int rightBound = width()-100;
      for (int i = 0; i < numButtons; i++) {
        color buttonColor = #32a852;
        color buttonTextColor = makeBrighter(#32a852);
        Button b = new Button((int)(leftBound + (double)i/(numButtons-1) * (rightBound - leftBound)), height() - 150, buttonWidth, buttonHeight, buttonColor, buttonColor, LIGHT_GRAY, buttonTextColor, 20, "something", true);  
        buttons.add(b);
      }
  }
  
    
  public void display() {
    image(backgroundImage, 0, -100);
    image(backgroundImage, 0, backgroundImage.height - 100);
    
    returnButton.update();
    returnButton.display();
    
    displayAllButtons();
    if (returnButton.isClicked()) {
      setActive(false);
      menu.setActive(true);
    }
  }
  
  private void displayAllButtons() {
    for (Button button : buttons) {
      button.update();
      button.display();
    }
  }
}
