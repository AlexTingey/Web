import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ScreenSaver extends PApplet {

Lines[] myLines = new Lines[15];


public void setup () {
  size(1920, 1080);
  background(227, 227, 234);
  frameRate(120);
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(1, 25), random(1, 20));
  }
}
public void draw() {
  if (frameCount == 2000) {
    frameCount = 0;
    background(227, 227, 234);
  }
  for (int i=0; i<myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
  }
}


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
  public void setup () {
    size(400, 400);
    background(227, 227, 234);
    xpos = random(width);
    ypos = random(height);
    frameRate(120);
  }
  public void display() {
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
  public void moveRight(float startX, float startY, float moveCount) {
    for (float i = 0; i<moveCount; i++) {
      xpos = startX + i;
    }
  }
  public void moveLeft(float startX, float startY, float moveCount) {
    for (float i = 0; i<moveCount; i++) {
      xpos = startX - i ;
    }
  }
  public void moveUp(float startX, float startY, float moveCount) {
    for (float i = 0; i<moveCount; i++) {
      ypos = startY - i;
    }
  }
  public void moveDown(float startX, float startY, float moveCount) {
    for (float i = 0; i<moveCount; i++) {
      ypos = startY + i;
    }
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--hide-stop", "ScreenSaver" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
