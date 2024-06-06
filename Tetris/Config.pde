public class Config extends Screen {
  private PImage backgroundImage;
  private int screenWidth, screenHeight;
  private int buttonWidth, buttonHeight;
  
  public Config() {
      backgroundImage = loadImage("menuBackground2.png");
  }
  
  public void display() {
    image(backgroundImage, 0, -100);
    image(backgroundImage, 0, backgroundImage.height - 100);
  }
}
