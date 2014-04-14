// Drawing tool for movie poster and opening credits
// © Luna Valentini for the course SEI2014 @ UnirSM  
// Didactic purpose, MIT License, March 2014, San Marino

// I'm trying to figure it out how to use classes for my drawing tool
// Now it's only a mess! 
// Totally a WORK IN PROGRESS!
// The main file for this class il called "ScottPilgrim_3" (look for it)


class Trg {
  //Global variables
  float x=0;
  float y=0;
  float speedX = 4;
  float speedY = 3;
  

  //Constructor - operates just once
  Trg(float _x, float _y) {

    x= _x;
    y= _y;
 
  }

  //Functions
  void run() {
    display();
    move();
    bounce();
    //gravity();
  }
  
  /*
  void gravity(){
    speedY += 0.2;
  }
  */
  
  void bounce(){
    if (x>(mouseX+100) || x<(mouseX-100)){
      speedX = speedX*-1;
    }
    
    if (y>(mouseY+100) || y<(mouseY-100)){
      speedY = speedY*-1;
    }
    
  }

  void move() {
    x += speedX;
    y += speedY;
  }

  void display() {
    triangle(mouseX+x,mouseY+y, mouseX-50, mouseY-10, mouseX-100, mouseY-50);
  }
}
