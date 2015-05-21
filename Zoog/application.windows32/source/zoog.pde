void setup(){
  //sets the size
  size(500,900);
  frameRate(60);
}
void draw(){
  
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
void zoog(int xpos, int ypos){
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
    text("ウィーブ",width/2 + 10 , height/2 + 10);
}
}
