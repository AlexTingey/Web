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

public class Zoog extends PApplet {

public void setup(){
  //sets the size
  size(500,900);
  frameRate(60);
}
public void draw(){
  
  background(51,180,242);
  //Set Center Mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  //Make The Grass Grow
  fill(50,250,82);
  rect(250,899,500,500);
  stroke(3);
  textAlign(CENTER);
  fill(255);
  text("Zoog Simulator 2014",width/2,height/2);
  zoog(width/2 + 70, 648);
  zoog(mouseX, mouseY);
}
public void zoog(int xpos, int ypos){
  //Draw Zoogs Body
  stroke(0);
  fill(240,12,176);
  rect(xpos,ypos,20,100);
   //draw zoog's head
  stroke(0);
  fill(255);
  ellipse(xpos,ypos -30 ,60,60);
  //Draw Zoogs Eyes
  fill(0);
  ellipse(xpos - 19,ypos - 30,16,32);
  ellipse(xpos + 19,ypos - 30,16,32);
  //Draw Zoog's legs
  stroke(0);
  line(xpos-10,ypos+50,xpos-20,ypos+60);
  line(xpos+10,ypos+50,xpos+20,ypos+60);
  println(xpos);
  println(ypos);
  if(xpos == 200 && ypos == 200){
    text("\u30a6\u30a3\u30fc\u30d6",width/2 + 10 , height/2 + 10);
}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--hide-stop", "Zoog" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
