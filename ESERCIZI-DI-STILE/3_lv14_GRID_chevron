/* 
Basato su:  P_2_1_1_03  — Segue licenza originale.
Algoritmo modificato per esercizio durante il corso SEI 2014 @ UnirSM — Più info http://goo.gl/59obuO 
*/

// This code was modified from Generative Gestaltung, for school projects
//  by Università di San Marino. Non commercial use.

// P_2_1_1_03.pde
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
 * changing number, color and strokeweight on diagonals in a grid
 * 	 
 * MOUSE
 * position x          : diagonal strokeweight
 * position y          : number diagonals
 * left click          : new random layout
 * 
 * KEYS
 * s                   : save png
 * p                   : save pdf
 * 1                   : color left diagonal
 * 2                   : color right diagonal
 * 3                   : switch transparency left diagonal on/off
 * 4                   : switch transparency right diagonal on/off
 * 0                   : default
 */

import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

color colorBack = color(0); // cambiato colore di fondo da bianco a nero
color colorLeft = color(0);
color colorRight = color(0);

float tileCount = 1;
boolean transparentLeft = false;
boolean transparentRight = false;
float alphaLeft = 200; // cambiato da 100 a 200 ma non noto una gran differenza dall'originale
float alphaRight = 200; // cambiato da 100 a 200 ma non noto una gran differenza dall'originale

int actRandomSeed = 3;// cambiata da 0 a 3


void setup() {
  size(600, 600);

  colorMode(HSB, 360, 100, 100, 100);
  colorLeft = color(323, 100, 77);
}


void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  colorMode(HSB, 360, 100, 100, 100);
  background(colorBack);
  smooth();
  noFill();
  randomSeed(actRandomSeed);
  strokeWeight(mouseX/100);// spessore tratto cambiato da /15 a /100

  tileCount = mouseY/15;

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      float posX = width/tileCount*gridX;
      float posY = height/tileCount*gridY;

      if (transparentLeft == true) alphaLeft = gridY*10; 
      else alphaLeft = 100;

      if (transparentRight == true) alphaRight = 100-gridY*10; 
      else alphaRight = 100;

      int toggle = (int) random(0, 2);// aumentare le scelte dà disegni meno interessanti_2 è ok

      if (toggle == 0) {
        stroke(colorLeft, alphaLeft);
        line(posX, posY, posX+(width/tileCount)/100, posY+height/tileCount); //cambiato da /2 a /100 cambia angolazione linee 
        line(posX+(width/tileCount)/100, posY, posX+(width/tileCount), posY+height/tileCount); //cambiato da /2 a /100 cambia angolazione linee 
      }
      if (toggle == 1) {
        stroke(colorRight, alphaRight);
        line(posX, posY+width/tileCount, posX+(height/tileCount)/100, posY); //cambiato da /2 a /100 cambia angolazione linee
        line(posX+(height/tileCount)/100, posY+width/tileCount, posX+(height/tileCount), posY); //cambiato da /2 a /100 cambia angolazione linee 
      }
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}


void mousePressed() {
  actRandomSeed = (int) random(100000);
}




void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;

  if (key == '1') {
    if (colorLeft == color(273, 73, 51)) {
      colorLeft = color(323, 100, 77);
    } 
    else {
      colorLeft = color(273, 73, 51);
      //      colorLeft = color(0);
    }
  }
  if (key == '2') {
    if (colorRight == color(0)) {
      colorRight = color(192, 100, 64);
    } 
    else {
      colorRight = color(0);
    }
  }
  if (key == '3') {
    transparentLeft =! transparentLeft;
  }
  if (key == '4') {
    transparentRight =! transparentRight;
  }



  if (key == '0') {
    transparentLeft = false;
    transparentRight = false;
    colorLeft = color(323, 100, 77);
    colorRight = color(0);
  }
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}







