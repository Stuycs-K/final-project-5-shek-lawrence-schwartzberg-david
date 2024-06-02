public class MenuScreen {
  PImage backgroundImage;
  
  public MenuScreen() {  
    backgroundImage = loadImage("background.jpg");
    println(backgroundImage.width + " " + backgroundImage.height);
  }
  
  public void display() {
    windowResize(backgroundImage.width, backgroundImage.height);
    image(backgroundImage, 0, 0);
  }
}
