public abstract class Screen {
  private int screenWidth, screenHeight;
  private boolean active;
  
  public Screen() {
    active = true;
  }
  
  public boolean isActive() {
    return active;
  }
  
  public void setActive(boolean status) {
    active = status;
  }
  
  public int width() {
    return screenWidth;
  }
  
  public int height() {
    return screenHeight;
  }
  
  public void setWindowSize(int w, int h) {
    screenWidth = w;
    screenHeight = h;
  }
}
