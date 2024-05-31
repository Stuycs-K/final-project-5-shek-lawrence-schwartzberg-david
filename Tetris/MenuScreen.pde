public class MenuScreen {
  private int HEIGHT, WIDTH;
  
  public MenuScreen(int height, int width) {  
    HEIGHT = height;
    WIDTH = width;
  }
  
  public void display() {
    rect(0, 0, HEIGHT, WIDTH);
  }
}
