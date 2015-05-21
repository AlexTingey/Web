Lines[] myLines = new Lines[15];


void setup () {
  size(1920, 1080);
  background(227, 227, 234);
  frameRate(120);
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(1, 25), random(1, 20));
  }
}
void draw() {
  if (frameCount == 2000) {
    frameCount = 0;
    background(227, 227, 234);
  }
  for (int i=0; i<myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
  }
}


