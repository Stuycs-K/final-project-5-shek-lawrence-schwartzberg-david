public class ConfigScreen {
  private PImage backgroundImage;
  private int screenWidth, screenHeight;
  private int buttonWidth, buttonHeight;
  
  public ConfigScreen() {
      backgroundImage = loadImage("menuBackground2.png");
  }
  
  public void display() {
    image(backgroundImage, 0, -100);
    image(backgroundImage, 0, backgroundImage.height - 100);
  }
}
