/* 
Basato su: P_2_2_2_02  — Segue licenza originale.
Algoritmo modificato per esercizio durante il corso SEI 2014 @ UnirSM — Più info http://goo.gl/59obuO 
*/

// P_2_2_2_02.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * draw the path of an intelligent agent
 * 
 * MOUSE
 * position x          : drawing speed
 *
 * KEYS
 * 1-3                 : draw mode
 * Delete/Backspace    : clear display
 * s                   : save png
 * r                   : start pdf recording
 * e                   : stop pdf recording
 */

import processing.pdf.*;
import java.util.Calendar;

boolean recordPDF = false;


int NORTH = 0;
int EAST = 1;
int SOUTH = 2;
int WEST = 3;

float posX, posY;
float posXcross, posYcross;

int direction = SOUTH;
float angleCount = 1;    //// 1 - ...   //diminuisco le angolazioni possibili
float angle = getRandomAngle(direction);
float stepSize = 10; // cambio da 3 a 10: angoli retti e griglia quadrata
int minLength = 5; // cambio da 10 a 5

// width and brightness of the stroke depend on line length
int dWeight = 100; // cambio da 50 a 100 : linee più sottili
int dStroke = 4; 

int drawMode = 1;


void setup(){
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  background(360);

  posX = int(random(0, width));
  posY = 5;
  posXcross = posX;
  posYcross = posY;
}


void draw(){
  for (int i=0; i<=mouseX; i++) {

    // ------ draw dot at current position ------
    if (!recordPDF) {
      strokeWeight(5);// aumento tratto da 1  a 5
      stroke(180);
      point(posX, posY);
    }

    // ------ make step ------
    posX += 2*cos(radians(angle)) * stepSize; // aggiunto 2*...perchè 2? Perchè ho provato a caso :P
    posY += sin(radians(angle)) * stepSize;

    // ------ check if agent is near one of the display borders ------
    boolean reachedBorder = false;

    if (posY <= 50) {  // cambiato da 5 a 50 - crea bordo superiore
      direction = SOUTH;
      reachedBorder = true;
    } 
    else if (posX >= width-5) {
      direction = WEST;
      reachedBorder = true;
    }
    else if (posY >= height-50) {  //cambiato da -5 a -50 crea bordo inferiore
      direction = NORTH;
      reachedBorder = true;
    }
    else if (posX <= 5) {
      direction = EAST;
      reachedBorder = true;
    }

    // ------ if agent is crossing his path or border was reached ------
    int px = (int) posX;
    int py = (int) posY;
    if (get(px, py) != color(360) || reachedBorder) {
      angle = getRandomAngle(direction);
      float distance = dist(posX, posY, posXcross, posYcross);
      if (distance >= minLength) {
        strokeWeight(distance/dWeight);
        if (drawMode == 1) stroke(0);
        if (drawMode == 2) stroke(52, 100, distance/dStroke);
        if (drawMode == 3) stroke(300, 100, 64, distance/dStroke); // 192 a 300 da blu a viola
        line(posX, posY, posXcross, posYcross);
      }
      posXcross = posX;
      posYcross = posY;
    }
  }
}


float getRandomAngle(int theDirection) {
  float a = (floor(random(-angleCount, angleCount)) + 0.5) * 90.0/angleCount;

  if (theDirection == NORTH) return (a - 90);
  if (theDirection == EAST) return (a);
  if (theDirection == SOUTH) return (a + 90);
  if (theDirection == WEST) return (a + 180);

  return 0;
}



void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");

  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
  if (key == '3') drawMode = 3;
  
  // ------ pdf export ------
  // press 'r' to start pdf recording and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, timestamp()+".pdf");
      println("recording started");
      recordPDF = true;
      colorMode(HSB, 360, 100, 100, 100);
      background(360); 
      smooth();
      posX = int(random(0, width));
      posY = 5;
      posXcross = posX;
      posYcross = posY;
    }
  } 
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(360); 
    }
  }  
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



