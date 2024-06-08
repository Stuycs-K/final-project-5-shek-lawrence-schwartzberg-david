public class Button {
  float x, y;
  float buttonWidth, buttonHeight;
  
  boolean highlight;
  color buttonColor, strokeColor, highlightColor;
  
  color textColor;
  int fontSize;
  String text;
  
  public Button(float x_, float y_, float buttonWidth_, float buttonHeight_, color buttonColor_, color strokeColor_, 
                color highlightColor_, color textColor_, int fontSize_, String text_, boolean centered) {
    if (!centered) {
      this.x = x_;
      this.y = y_;
    } else {
      this.x = x_ - buttonWidth_/2;
      this.y = y_ - buttonHeight_/2;
    }
      
    this.buttonWidth = buttonWidth_;
    this.buttonHeight = buttonHeight_;
    
    this.highlight = false;
    this.buttonColor = buttonColor_;
    this.strokeColor = strokeColor_;
    this.highlightColor = highlightColor_;
    
    this.textColor = textColor_;
    this.fontSize = fontSize_;
    this.text = text_;
  }
  
  public Button(float x_, float y_, float buttonWidth_, float buttonHeight_, color buttonColor_, color strokeColor_, color highlightColor_, color textColor_, int fontSize_, String text_) {
    this(x_, y_, buttonWidth_, buttonHeight_, buttonColor_, strokeColor_, highlightColor_, textColor_, fontSize_, text_, false);
  }
  
  public void display() {
    fill(highlight ? highlightColor : buttonColor);
    stroke(strokeColor);
    rect(x, y, buttonWidth, buttonHeight);
    
    fill(textColor);
    textSize(fontSize);
    textAlign(CENTER, CENTER);
    text(text, x+buttonWidth/2, y+buttonHeight/2);
  }
  
  public void update() {
    if (mouseX >= x && mouseX <= (x+buttonWidth) && mouseY >= y && mouseY <= (y+buttonHeight)) {
      highlight = true;
    } else {
      highlight = false;
    }
  }
  
  public boolean isClicked() {
    return highlight && mousePressed;
  }

}
