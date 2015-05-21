Buttons[] numButton = new Buttons[10];
Buttons [] opButtons = new Buttons[11];
Buttons [] spButtons = new Buttons [1];
String displayValue = "0";
String valueToCompute = "";
String valueToCompute2 = "";
float valueToComputeI = 0;
float valueToComputeI2 = 0;
float result = 0;
char opValue;
boolean firstNum;

void setup() {
  size(330, 330);
  background(50, 55, 55);
  frameRate(10);
  noFill();
  strokeWeight(3);
  stroke(200);
  rect(1, 1, 327, 327);
  //populate number buttons
  numButton[0] = new Buttons(65, 275).asNumber(0, 45, 45);
  numButton[1] = new Buttons(10, 220).asNumber(1, 45, 45);
  numButton[2] = new Buttons(65, 220).asNumber(2, 45, 45);
  numButton[3] = new Buttons(120, 220).asNumber(3, 45, 45);
  numButton[4] = new Buttons(10, 165).asNumber(4, 45, 45);
  numButton[5] = new Buttons(65, 165).asNumber(5, 45, 45);
  numButton[6] = new Buttons(120, 165).asNumber(6, 45, 45);
  numButton[7] = new Buttons(10, 110).asNumber(7, 45, 45);
  numButton[8] = new Buttons(65, 110).asNumber(8, 45, 45);
  numButton[9] = new Buttons(120, 110).asNumber(9, 45, 45);
  opButtons[0] = new Buttons(175, 110).asOperator("+");
  opButtons[1] = new Buttons(175, 165).asOperator("-");
  opButtons[2] = new Buttons(175, 220).asOperator("*");
  opButtons[3] = new Buttons(175, 275).asOperator("/");
  opButtons[4] = new Buttons(120, 275).asOperator("=");
  opButtons[5] = new Buttons(120, 55).asOperator("C");
  opButtons[6] = new Buttons(65, 55).asOperator("√");
  opButtons[7] = new Buttons (10, 55).asOperator("҉"); 
  opButtons[8] = new Buttons (175, 55).asOperator("n");
  opButtons[9] = new Buttons (230, 55).asOperator("%");
  spButtons[0] = new Buttons(230, 110).asSpecial(".");
  opButtons[10] = new Buttons(230, 165).asOperator("S");
  //Set the initial value of the first num to true 
  firstNum = true;
}

void draw() {
  for (int i=0; i<numButton.length; i++) {
    Buttons inumButton = numButton[i];
    inumButton.display();
  }
  updateDisplay();
  for (int i = 0; i<opButtons.length; i++) {
    Buttons iopButton = opButtons[i];
    iopButton.display();
  }
  updateDisplay();
  for (int i=0; i<spButtons.length; i++) {
    Buttons inumButton = numButton[i];
    inumButton.display();
  }
  for (int i=0; i<spButtons.length; i++) {
    Buttons ispButton = spButtons[i];
    ispButton.display();
  }
  updateDisplay();
}
void mousePressed() {
  for (int i = 0; i<numButton.length; i++) {
    Buttons inumButton = numButton[i];
    inumButton.click();
    if (inumButton.overBox) {
      //left or right side of operator
      if (firstNum) {
        println(i + "" + inumButton.numButtonValue);
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<spButtons.length; i++) {
    Buttons iSpButton = spButtons[i];
    iSpButton.click();
    if (iSpButton.overBox) {
      if (iSpButton.spButtonValue == ".") {
        if (iSpButton.overBox && firstNum == true) {
          valueToCompute += iSpButton.spButtonValue;
          displayValue = valueToCompute;
        } else if (iSpButton.overBox && firstNum == false) {
          valueToCompute2 += iSpButton.spButtonValue;
          displayValue = valueToCompute2;
        }
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    Buttons iOpButton = opButtons[i];
    iOpButton.click();
    if (iOpButton.overBox) {
      if (iOpButton.opButtonValue == "+") {
        if (result != 0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum = true;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } 
      if (iOpButton.opButtonValue == "-") {
        if (result != 0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = true;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      }
      if (iOpButton.opButtonValue == "*") {
        if (result != 0) {
          opValue = '*';
          valueToCompute2 = "";
          firstNum = true;
          displayValue = "*";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "*";
        }
      }
      if (iOpButton.opButtonValue == "/") {
        if (result != 0) {
          opValue = '/';
          valueToCompute2 = "";
          firstNum = true;
          displayValue = "/";
        } else {
          opValue = '/';
          firstNum = false;
          displayValue = "/";
        }
      } else if (iOpButton.opButtonValue == "=") {
        //get the answer
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "C") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI = 0;
        result = 0;
        firstNum = true;
      } else if (iOpButton.opButtonValue == "√") {
        if (result !=0) {
          opValue = '√';
          valueToCompute2 = "";
          firstNum = true;
          displayValue = "√";
        } else {
          opValue = '√';
          firstNum = false;
          displayValue = "√";
        }
      } else if (iOpButton.opButtonValue == "҉") {
        if (result !=0) {
          opValue = '҉';
          valueToCompute2 = "";
          firstNum = true;
          displayValue = "҉";
        } else {
          opValue = '҉';
          firstNum = false;
          displayValue = "҉";
        }
      } else if (iOpButton.opButtonValue == "n") {
        opValue = 'n';
        performCalculation();
      } else if (iOpButton.opButtonValue == "%") {
        if (result !=0) {
          opValue = '%';
          valueToCompute2 = "";
          firstNum = true;
          displayValue = "%";
        } else {
          opValue = '%';
          firstNum = false;
          displayValue ="%";
        }
      } else if (iOpButton.opButtonValue == "S") {
        opValue = 'S';
        performCalculation();
      }
    }
  }
}
void updateDisplay() {
  fill(200, 200, 200, 150);
  rect(10, 10, 310, 35, 7);
  fill(0);
  textSize(25);
  text(displayValue, 20, 37);
  fill(50, 55, 55);
  noStroke();
  rect(230, 225, 100, 75);
  fill(255);
  textSize(10);
  text("Val 1 : " + valueToCompute, 240, 240);
  text("Val 2 : " + valueToCompute2, 240, 260);
  text("Result: " + result, 240, 280);
  text("Operator: " + opValue, 240, 300);
}
void performCalculation() {
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2; 
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '√') {
    result = sqrt(valueToComputeI);
    displayValue = str(result);
  } else if (opValue == '҉') {
    result = int(random(1000)) + sqrt(valueToComputeI) / 7;
    displayValue = str(result);
  } else if (opValue == 'n') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*-1;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*-1;
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == '%') {
    result = valueToComputeI * 0.01;
    displayValue = str(result);
  } else if (opValue == 'S') {
    result = sq(valueToComputeI);
    displayValue = str(valueToComputeI);
  }
  if (firstNum) {
    valueToCompute = displayValue;
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }
}
void keyPressed() {
  if (key == '1') {
    handleKeyPressNum("1");
  } else if (key == '2') {
    handleKeyPressNum("2");
  } else if (key == '3') {
    handleKeyPressNum("3");
  } else if (key == '4') {
    handleKeyPressNum("4");
  } else if (key == '5') {
    handleKeyPressNum("5");
  } else if (key == '6') {
    handleKeyPressNum("6");
  } else if (key == '7') {
    handleKeyPressNum("7");
  } else if (key == '8') {
    handleKeyPressNum("8");
  } else if (key == '9') {
    handleKeyPressNum("9");
  } else if (key == '0') {
    handleKeyPressNum("0");
  }
}

void handleKeyPressNum(String keyPress) {
  if (firstNum) {
    valueToCompute += keyPress;
    displayValue = valueToCompute;
  } else {
    valueToCompute2 += keyPress;
    displayValue = valueToCompute2;
  }
}
void handleKeyPressOp(String keyPress) {
  if (keyPress == "C") {
    displayValue = "0";
    opValue = 'C';
    valueToCompute = "";
    valueToCompute2 = "";
    valueToComputeI = 0;
    result = 0;
    firstNum = true;
  } else if (keyPress == "=") {
    firstNum = true;
    performCalculation();
  }
}

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


