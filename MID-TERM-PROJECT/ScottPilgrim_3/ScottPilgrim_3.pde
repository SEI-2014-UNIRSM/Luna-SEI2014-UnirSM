// Drawing tool for movie poster and opening credits
// © Luna Valentini for the course SEI2014 @ UnirSM  
// Didactic purpose, MIT License, March 2014, San Marino

// I'm trying to figure it out how to use classes for my drawing tool
// Now it's only a mess! 
// Totally a WORK IN PROGRESS!
// Class panel code uploaded with name "Class_for_ScottPilgrim_3" (look for it)


import processing.pdf.*;
import java.util.Calendar;

boolean recordPDF = false;


float xp = 0; //if I write =Null I declare the box but it's empty
int yp = 0;


color col = color(360, 100, 100);  // color variable

PFont font;

int fontSizeMin = 100;

Trg myTrg; //declares the instance of class
//Trg myTrg2;

void setup() {
  size(1280, 720, OPENGL);
  frameRate(30);
  colorMode(HSB, 360, 100, 100); //change color mode
  background(360, 0, 0);
  //strokeWeight(5); 
  stroke(col);
  noFill();
  translate(640,360);
  
  //Initialize
  myTrg = new Trg(mouseX,mouseY);  //instance of class
  //myTrg2 = new Trg(width/2,height/2);  

  font = createFont("GearedSlab-Extrabold", 100);
}

void draw() {

  if (mousePressed) {
    
    myTrg.run(); //call the functionality
 // myTrg2.run();

    color col = color(random(240, 300), 100, 100); // random color between a selected range
    stroke(col);  //every triangle has a different stroke color


    /*
    beginShape();
    vertex(mouseX, mouseY); // this create the trail
    vertex(xp*2, yp*2); 
    vertex(xp+10, yp+10);
    vertex(xp, yp);
    endShape(CLOSE);
    */

  }

  xp = mouseX;
  yp = mouseY;


  //save frame for animation
  if (key =='s' || key =='S') {
    saveFrame("Animation01/anim-####.tga");
    println(frameCount);
  }
}


void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(0); 
  // delete what I drew and recall background

  if (key == 'f' || key == 'F') {

    font = createFont("GearedSlab-Extrabold", 100);  // set the font
    textFont(font, fontSizeMin);
    textAlign(CENTER);
    fill(color(random(240, 300), 100, 100));//
    text("RAMONA", random(width), random(height));
  }

  // ------ pdf export ------
  // press 'r' to start pdf recording and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!

  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "####.pdf");
      println("recording started");
      recordPDF = true;
    }
  } 
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
    }
  }
}
