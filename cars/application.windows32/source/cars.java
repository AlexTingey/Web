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

public class cars extends PApplet {

//Car myCar;
//Car myCar2;
Car[] myCars = new Car[500];
public void setup(){
  frameRate(60);
  size(500,500);
  background(255);
  //myCar uses constructor 1
  //myCar = new Car(random(width),random(height));
  //myCar uses constructor 2
  //myCar2 = new Car(random(width), random(height), int(random(100)), color(random(255),random(255),random(255)), random(10));
  for(int i = 0; i < myCars.length;i++){
    myCars[i] = new Car(random(width), random(height), PApplet.parseInt(random(100)), color(random(255),random(255),random(255)), random(10));
  }
}
public void draw(){
  background(255);
  //myCar.display();
  //myCar.drive();
  //myCar2.display();
  //myCar2.drive();
  for(int i = 0; i < myCars.length;i++){
     Car iCarly = myCars[i];
     iCarly.display();
     iCarly.drive(); 
  }
  
}

class Car{
  //member Variables
  int cSpeed;
  int cColor;
  float xpos, ypos, left;

  
  //Constructor 1
  Car(float tempX, float tempY){
   xpos = tempX;
   ypos = tempY;
   cSpeed = 5;
   cColor = color(255,0,0);
  }
    //constructor 2
  Car(float tempX, float tempY, int tempSpeed, int tempColor, float tempLeft){
    xpos = tempX;
    ypos = tempY; 
    cSpeed = tempSpeed;
    cColor = tempColor;
    left = tempLeft; 
  }
  public void display(){
    rectMode(CENTER);
    fill(cColor);
    rect(xpos,ypos,20,10);
    
    fill(0);
    rect(xpos-8,ypos+8,7,4);
    rect(xpos+8,ypos+8,7,4);
    rect(xpos-8,ypos-8,7,4);
    rect(xpos+8,ypos-8,7,4);
    fill(214,252,250);
    rect(xpos+4,ypos-1,4,7);
    fill(0);
    line(xpos,ypos,xpos,ypos-13);
  }
  
  public void drive(){
    if(left<=5){
      xpos = xpos + cSpeed;
      if(xpos > width){
       xpos = 0; 
    }
    }else{
     xpos = xpos - cSpeed;
     if (xpos < 0){
       xpos = width;
   }
  }
 }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "cars" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
