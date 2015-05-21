class Buttons {
  float x;
  float y;
  float w = 45;
  float h = 45;
  boolean onBox;
  boolean isNumber;
  boolean isOperator;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  int boxSize = 45; 
  boolean overBox = false;



  //First Constructor
  Buttons(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    onBox = false;
  }
  Buttons asNumber(float tempNumButtonValue, int tempW, int tempH) {
    isNumber = true; 
    numButtonValue = tempNumButtonValue;
    h = tempH;
    w = tempW; 
    return this;
  }
  Buttons asOperator(String tempOpButtonValue) {
    isOperator = true;
    opButtonValue = tempOpButtonValue;
    return this;
  }
  Buttons asSpecial(String buttonValue) {
    isSpecial = true; 
    spButtonValue = buttonValue;
    return this;
  }
  //member methods
  void display() {
    if (isNumber) {
      fill(177);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h, 10);
      fill(122, 44, 22);
      textSize(24);
      text(int(numButtonValue), x+15, y+30);
    } else if (isSpecial) {
      fill(133);
      stroke(0);
      strokeWeight(2);
      rect(x, y, boxSize, boxSize, 10);
      fill(70,18,18);
      textSize(24);
      text(spButtonValue, x+15, y+30);
    }
    if (isOperator) {
      fill(133);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h, 10);
      fill(122, 44, 22);
      textSize(24);
      text(opButtonValue, x+15, y+30);
    }
  }
  void click() {
    //check to see if the mouse be clickity clakin know what im sayin'
    overBox = mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
  }
}

