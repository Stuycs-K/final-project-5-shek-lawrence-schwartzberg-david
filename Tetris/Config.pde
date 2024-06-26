public class Config extends Screen {
  private Button returnButton;
  private Button promptButton;
  private Button levelSelectButton;
  boolean waitingForKeyPress;
  boolean waitingForLevelSelect;
  int whichButton;
  
  int countdown;
  
  public Config() {
    setWindowSize(menuScreenBackgroundImage.width, menuScreenBackgroundImage.height);
    
    int buttonWidth = 120;
    int buttonHeight = 40;
    color returnButtonBg = #653D9B;
    color returnButtonhighlightColor = makeBrighter(returnButtonBg, 1.5);
    color returnButtonTextColor = makeBrighter(returnButtonBg);
    returnButton = new Button(width() - 80, height() - 30, buttonWidth, buttonHeight, returnButtonBg, returnButtonBg, returnButtonhighlightColor, returnButtonTextColor, 20, "Main Menu", true);  
    
    promptButton = new Button(width()/2, height()/2 - 100, 480, 190, #4287f5, #4287f5, #4287f5, #1527c2, 80, "Press a key", true);

    levelSelectButton = new Button(80, height() - 30, buttonWidth, buttonHeight, returnButtonBg, returnButtonBg, returnButtonhighlightColor, returnButtonTextColor, 20, "Start Level: 0", true);  
    
    int numButtons = controller.keyCodes.length;
    String[] labels = new String[] 
      {"Move\nLeft", "Move\nRight", "Soft\nDrop", "Hard\nDrop", "Rotate\nLeft", "Rotate\nRight", "Store\nPiece", "Pause"};
    color[] colors = new color[] {#f04848, #e6a85c, #e0c112, #1cbd37, #18add6, #2156db, #9721db, #db21a3};
    int leftBound = 70;
    int rightBound = width()-70;
    buttonWidth = 80;
    buttonHeight = 50;
    for (int i = 0; i < numButtons; i++) {
      color buttonColor = colors[i];
      color highlightColor = makeBrighter(buttonColor, 1.25);
      // make red, blue, purple, pink highlights a little brighter
      if (i >= 6) {
        highlightColor = makeBrighter(buttonColor, 1.5);
      } else if (i == 0){
        highlightColor = #ff7e75;
      }
      int x = (int)(leftBound + (double)i/(numButtons-1) * (rightBound - leftBound));
      Button b = new Button(x, height() - 140, buttonWidth, buttonHeight, buttonColor, buttonColor, highlightColor, WHITE, 20, labels[i], true);  
      buttons.add(b);
    }
    
    waitingForKeyPress = false;
    countdown = 60;
  }
  
    
  public void display() {
    displayMenuScreenBackgroundImage();
    displayTetrisLogo();
    
    returnButton.update();
    returnButton.display(); 
    
    if (returnButton.isClicked()) {
      this.setActive(false);
      menu.setActive(true);
      waitingForKeyPress = false;
      promptButton.text = "Press a key";
    }
    
    if (levelSelectButton.isClicked()) {
      waitingForLevelSelect = true;
      promptButton.text = "Choose your\nstarting level";
    }
    
    if (!waitingForLevelSelect && !waitingForKeyPress) {
      levelSelectButton.update();
    } else {
      promptButton.display();
    }
    
    levelSelectButton.display(); 
    
    if (!waitingForKeyPress) {
      displayAllButtons(countdown <= 0 && !waitingForLevelSelect);
    } else {
      displayAllButtons(false);
      promptButton.display();
    }
    
    if (countdown > 0) {
      countdown--;
    }
  }
  
  private void displayAllButtons(boolean checkForClicked) {
    int[] keyCodes = controller.keyCodes;
    for (int i = 0; i < buttons.size(); i++) {
      Button button = buttons.get(i);
      
      if (checkForClicked) {
        button.update();
      }
      button.display();
      
      fill(WHITE);
      
      int fontSize = 20;
      if (keyCodes[i] == 157) {
        fontSize = 15;
      }
      Button inputKey = new Button(button.x, button.y+55, button.buttonWidth, button.buttonHeight, button.buttonColor, button.buttonColor, LIGHT_GRAY, button.textColor, fontSize, 
                                   keyCodeToString(keyCodes[i]), false);
      inputKey.display();
      
      if (checkForClicked) {
        if (button.isClicked()) {
          waitingForKeyPress = true;
          whichButton = i;
        }
      }
        
    }
  }
  
  public void setKey(int newKeyCode) {
    if (controller.setNewKeyCode(whichButton, newKeyCode)) {  
      waitingForKeyPress = false;
      promptButton.text = "Press a key";
    } else {
      promptButton.text = "Choose\nanother key";
    }
  }
  
  public void setLevel(int newKeyCode) {
    if (Character.isDigit((char)newKeyCode)){
      startLevel = Integer.parseInt(""+(char)newKeyCode);
      levelSelectButton.text = "Start Level: " + startLevel;
      waitingForLevelSelect = false;
    }
  }
  
  public void setActive(boolean status) {
    super.setActive(status);
    countdown = 20;
  }
  
  private String keyCodeToString(int code) {
  switch(code) {
    case 0:
      return "FN";
      
    case 8:
      return "BACK-\nSPACE";
      
    case 9:
      return "TAB";
      
    case 10:
      return "ENTER";
      
    case 16:
      return "SHIFT";
      
    case 17:
      return "CONTROL";
      
    case 18:
      return "OPTION";
      
    case 20:
      return "CAPS\nLOCK";
      
    case 32:
      return "SPACE";
      
    case 37:
      return "LEFT";
      
    case 38:
      return "UP";
    
    case 39:
      return "RIGHT";
      
    case 40:
      return "DOWN";
      
    case 157:
      return "COMMAND";
      
    case 192:
      return "`";
    
    case 222:
      return "'";
    
    case 65406:
      return "OPTION2";
    
    default:
      return ""+(char)code;
  }
  
}

}
