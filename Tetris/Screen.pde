public abstract class Screen {
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
}
