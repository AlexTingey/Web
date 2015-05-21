class Lines {
  float xpos;
  float ypos;
  float strokeW;
  float pointCount;
  Lines(float tempx, float tempy, float tempStroke, float tempPointCount) {
     tempx = xpos;
     tempy = ypos; 
     strokeW = tempStroke;
     pointCount = tempPointCount;
  }
  void setup () {
    size(400, 400);
    background(227, 227, 234);
    xpos = random(width);
    ypos = random(height);
    frameRate(120);
  }
  void display() {
    strokeW = 2;
    pointCount = random(1, 25);
    stroke(random(255));
    strokeWeight(strokeW);
    if (xpos>width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else if (random(100)<75 && random(100) > 50) {
      moveRight(xpos, ypos, pointCount);
      point(xpos, ypos);
      strokeWeight(strokeW);
    } else if (random(100)<55 && random(100)>25 ) {
      moveLeft(xpos, ypos, pointCount);
      point(xpos, ypos);
      strokeWeight(strokeW);
    } else if (random(100)<99 && random(100) > 75) {
      moveDown(xpos, ypos, pointCount);
      point(xpos, ypos);
      strokeWeight(strokeW);
    } else if (random(100)<25 && random(100)>0) {
      moveUp(xpos, ypos, pointCount);
      point(xpos, ypos);
      strokeWeight(strokeW);
    }
  }
  void moveRight(float startX, float startY, float moveCount) {
    for (float i = 0; i<moveCount; i++) {
      xpos = startX + i;
    }
  }
  void moveLeft(float startX, float startY, float moveCount) {
    for (float i = 0; i<moveCount; i++) {
      xpos = startX - i ;
    }
  }
  void moveUp(float startX, float startY, float moveCount) {
    for (float i = 0; i<moveCount; i++) {
      ypos = startY - i;
    }
  }
  void moveDown(float startX, float startY, float moveCount) {
    for (float i = 0; i<moveCount; i++) {
      ypos = startY + i;
    }
  }
}

