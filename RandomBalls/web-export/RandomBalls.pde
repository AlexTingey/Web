
void setup(){
  size(1920,1080);
  frameRate(120);
  noStroke();
}
void draw(){
  fill(random(255),255,255);
  ellipse(mouseX,mouseY, 100, 100);
  
}

