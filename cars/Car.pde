class Car{
  //member Variables
  int cSpeed;
  color cColor;
  float xpos, ypos, left;

  
  //Constructor 1
  Car(float tempX, float tempY){
   xpos = tempX;
   ypos = tempY;
   cSpeed = 5;
   cColor = color(255,0,0);
  }
    //constructor 2
  Car(float tempX, float tempY, int tempSpeed, color tempColor, float tempLeft){
    xpos = tempX;
    ypos = tempY; 
    cSpeed = tempSpeed;
    cColor = tempColor;
    left = tempLeft; 
  }
  void display(){
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
  
  void drive(){
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
