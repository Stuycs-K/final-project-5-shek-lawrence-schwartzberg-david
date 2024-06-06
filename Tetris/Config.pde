public class Config extends Screen {
  private PImage backgroundImage;
  private Button returnButton;
  
  public Config() {
    backgroundImage = loadImage("menuBackground2.png");
    setWindowSize(backgroundImage.width, backgroundImage.height);
    int buttonWidth = 120;
    int buttonHeight = 40;
    color returnButtonBg = #653D9B;
    color returnButtonText = makeBrighter(returnButtonBg);
    returnButton = new Button(width() - 80, height() - 30, buttonWidth, buttonHeight, returnButtonBg, returnButtonBg, LIGHT_GRAY, returnButtonText, 20, "Main Menu", true);  
    
    int numButtons = controller.keyCodes.length;
      // 0-left, 1-right, 2-softdrop, 3-harddrop, 4-rotateLeft, 5-rotateRight, 6-storePiece, 7-pause
    String[] labels = new String[] 
      {"Left", "Right", "Soft\nDrop", "Hard\nDrop", "Rotate\nLeft", "Rotate\nRight", "Store\nPiece", "Pause"};
    int leftBound = 100;
    int rightBound = width()-100;
    buttonWidth = 75;
    buttonHeight = 50;
    for (int i = 0; i < numButtons; i++) {
      color buttonColor = #32a852;
      color buttonTextColor = makeBrighter(#32a852);
      int x = (int)(leftBound + (double)i/(numButtons-1) * (rightBound - leftBound));
      Button b = new Button(x, height() - 170, buttonWidth, buttonHeight, buttonColor, buttonColor, LIGHT_GRAY, buttonTextColor, 20, labels[i], true);  
      buttons.add(b);
    }
  }
  
    
  public void display() {
    image(backgroundImage, 0, -100);
    image(backgroundImage, 0, backgroundImage.height - 100);
    
    returnButton.update();
    returnButton.display();
    
    if (returnButton.isClicked()) {
      this.setActive(false);
      menu.setActive(true);
    }
    
    displayAllButtons();
  }
  
  private void displayAllButtons() {
    for (int i = 0; i < buttons.size(); i++) {
      Button button = buttons.get(i);
      
      button.update();
      button.display();
      
      if (button.isClicked()) {
        ;
      }
        
    }
  }

}
