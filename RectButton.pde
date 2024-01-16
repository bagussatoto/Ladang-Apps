interface RectDisplay {
  void run(int x, int y, int w, int h, color fillColour, color strokeColour, color strokeWidth, String text, PImage image, int popScale, boolean isHovered);
}

class RectButton extends ButtonShell {
  int w;
  int h;
  color fillColour;
  color strokeColour;
  color strokeWidth;
  String text;
  PImage image;
  int popScale;
  RectDisplay onDisplay;
  PGraphics layer;
  
  RectButton(int _x, int _y, int _w, int _h, int _fillColour, int _strokeColour, int _strokeWidth, String _text, Executable _onActivate) {
    super(_x, _y, _onActivate);
    w = _w;
    h = _h;
    fillColour = _fillColour;
    strokeColour = _strokeColour;
    strokeWidth = _strokeWidth;
    text = _text;
    image = null;
    popScale = 1;
  }
  
  void display() {
    if (onDisplay != null) {
      onDisplay.run(x, y, w, h, fillColour, strokeColour, strokeWidth, text, image, popScale, isHovered());
    } else if (layer == null) {
      fill(fillColour);
      if (isHovered()) {
        colorMode(HSB);
        fill(hue(fillColour), saturation(fillColour), brightness(fillColour) - 30);
        colorMode(RGB);
      }
      stroke(strokeColour);
      strokeWeight(strokeWidth);
      
      rect(x, y, w, h);
      
      if (image != null) {
        stroke((isHovered()) ? #FF0000: strokeColour);
        rect(x, y, w, h);
        
        image(image, x, y, w, h);
      }
      
      if (text != "") {
        fill(0);
        float divWidth = w * 0.9 / text.length()*2;
        float divHeight = h * 0.9;
        float size = min(divWidth, divHeight) * 0.8;
        textSize(size);
        text(text, x, y - size/10);
      }
    } else {
      layer.beginDraw();
      
      layer.fill(fillColour);
      if (isHovered()) {
        layer.colorMode(HSB);
        layer.fill(hue(fillColour), saturation(fillColour), brightness(fillColour) - 20);
        layer.colorMode(RGB);
      }
      layer.stroke(strokeColour);
      layer.strokeWeight(strokeWidth);
      
      layer.rect(x, y, w, h);
      
      if (image != null) {
        layer.image(image, x, y, w, h);
      }
      
      if (text != "") {
        layer.text(text, x, y);
      }
      
      layer.beginDraw();
    }
  }
  
  boolean isHovered() {
    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
      return true;
    } else {
      return false;
    }
  }
}
