interface Executable {
  void run();
}

class ButtonShell {
  int x;
  int y;
  Executable onActivate;
  
  ButtonShell(int _x, int _y, Executable _onActivate) {
    x = _x;
    y = _y;
    onActivate = _onActivate;
  }
  
  void display() {
    return;
  }
  
  boolean isHovered() {
    return false;
  }
  
  boolean checkClick() {
    if (isHovered()) {
      onActivate.run();
      return true;
    }
    return false;
  }
}
