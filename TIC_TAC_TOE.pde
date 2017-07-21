public int board [][] = new int [3][3]; // Spielfeld 3x3 array 2 dimensionales Array //<>// //<>// //<>//
public int cellWidth, cellHeight;       // Größe wird angepasst
public int player = (int) random(3);  // Random Spieler zwischen 1 und 2 mit Cast Operator (int)
int rowFilledByPlayer;
color colorA = color(255,0,0);  //Rote Farbe
color colorB = color(24,116,205);  //Blaue Farbe
color colorBlack = color(0,0,0);  //Schwarze Farbe
public Boolean n = true;
public Boolean Start = true; // Startscreen anzeigen
public Boolean Ende = false;    // Für das Ende des Spiels
public Boolean Ergebnis = false;
public Boolean Ende2 = false;  // Ende2 wenn das Spiel unentschieden endet
public int Punkte1 = 0;    //Für die Spielerpunkte, hier Spieler 1
public int Punkte2 = 0;    //Für die Spielerpunkte, hier Spieler 2
public Boolean hoch = false;
public int hilfeplayer = 0;


void setup() 
{   
    size (900, 900);    // Größe des Spielfeldes
    rectMode(CORNER);
    ellipseMode(CORNER);
    
    // Teile den Bildschirm in 3 by 3 cells
    cellWidth = width / 3;  //Breite des Spielfeldes
    cellHeight = height / 3;  //Höhe des Spielfeldes
    fill(colorBlack);
    clearBoard();      //Funktionsaufruf, um das Spielfeld zu leeren      
}

void draw() 
{    
    background(255);  
    
    while (player == 0) // Für Random Spieler zwischen 1 und 2
    {
       player = (int) random(2);     //Cast Operator in integer
    }
  
    if (Start == true) // Ausgabe des Startscreens
    {
       ausgabe(); // Aufruf der Prozedur
    }
  
 else 
  
  if (Ende == false)
  {
    textSize(40);
    textAlign(CENTER, CENTER);
    fill(0);
    
    if (player == 1)    // Ausgabe wenn Spieler 1 ist
    {
         text("Spieler      (X) ist dran!",503,30);
         text(player,450,30);
    }
    
    if (player == 2)    // Ausgabe wenn Spieler 2 ist
    {
     text("Spieler     (O) ist dran!",503,30);
     text(player,450,30);
    }          
  }   
      
      
  if (boardFilled())   //Für Spielfeld, wenn es keinen Gewinner gibt
  {      
    {
        drawGameOver();  // Ausgabe des GameOvers
    }      
  }
  
       drawBoard();      //Funktionsaufruf
   
  if (boardFilled(player))   //Für Spielfeld, wenn es einen Gewinner gibt
  {
       drawGameOver();   // Ausgabe des GameOvers
  }   
 
 
if (key== 'a') // Zum Anzeigen des Menüs
 {   
     ausgabe();
 }

 if (key == 'e') // Zum Neustart
{
   setup();
   return;
}

if (key == 'k') // Um das Menü zu schließen
{
   Start = false; 
}

    fill(0,0,0); // Farbe für die Punkte
    textSize(30);
    text("Spieler 1 (X) = ",120,870);
    text(Punkte1,260,870);
    text("Spieler 2 (O) =",700,870);
    text(Punkte2,870,870);
    return;
}

void drawGameOver() //Ausgabe der GameOver-Funktion
{
    fill(0, 102, 153);
    textSize(width / 7);
    textAlign(CENTER, CENTER);
    fill(colorA);  
    text("Game Over!",450,700); 
    Ende2 = true;  // Zum Ende, wenn das Spiel unentschieden endet
}


void clearBoard() //Spielfeld leeren(zurücksetzen)
{
  for (int row = 0; row < 3; row++)
  {
    for (int col = 0; col < 3; col++)
    {
        board[row][col] = 0;    // row und col werden ins 2-dimensionale Array ''board'' geschrieben
    }
  }        
}

void drawBoard()     //Zeichnen des Spielfeldes mit 2 verschachtelten For-Schleifen
{
  for (int row = 0; row < 3; row++)
  {
    for (int col = 0; col < 3; col++)
    {
        drawCell(row, col);    //Parameterübergabe row und col für die Funktion drawCell
    }
  }         
}

void drawCell(int row, int col)  //Zeichne die Zelle mit den Parametern row und col
{
    noFill();
    stroke(0);
    rect (col * cellWidth, row * cellHeight, cellWidth, cellHeight);

  switch (board[row][col])     //Switch case Anweisung
  {
    case 1:
            line(col * cellWidth, row * cellHeight, (col+1) * cellWidth, (row+1) * cellHeight);
            line((col+1) * cellWidth, row * cellHeight, col * cellWidth, (row+1) * cellHeight);         
    break;
    
    case 2:
            ellipse(col * cellWidth, row * cellHeight, cellWidth, cellHeight);
    break;
  }
}


void playerMove() //Zum Setzen des (O) oder (X) 
{
  int row = mouseY / cellHeight;
  int col = mouseX / cellWidth;

  if (board[row][col] == 0) 
  {
     board[row][col] = player;
     player = oppositePlayer();
  }
}

int oppositePlayer() 
{
    return player = 3 - player;
}

  boolean boardFilled(int player) //Prüfung auf Gewinner im 2-dimensionalen Array ''board''
{
      //Prüfung auf Spieler 1                                   oder   Prüfung auf Spieler 2  
    if (board[0][0] == 1 && board[0][1] == 1 && board[0][2] == 1 || board[0][0] == 2 && board[0][1] == 2 && board[0][2] == 2) 
    {
        fill(colorB);
        textSize(50);
        ausgabe4(player);
        fill(colorBlack);
        text("drücken Sie ''a'',",450,50);
        text("um die Steuerung zu sehen", 450,150);
        ausgabe3();
        Ende = true;
        Ergebnis = true;
        return true;   
       }
       
    else if (board[1][0] == 1 && board[1][1] == 1 && board[1][2] == 1 || board[1][0] == 2 && board[1][1] == 2 && board[1][2] == 2) 
    {
        fill(colorB);
        textSize(50);
        ausgabe4(player);
        fill(colorBlack);
        text("drücken Sie ''a'',",450,50);
        text("um die Steuerung zu sehen", 450,150);
        ausgabe3();
        Ende = true;
        Ergebnis = true;
        return true; 
    }
  

  else if (board[2][0] == 1 && board[2][1] == 1 && board[2][2] == 1|| board[2][0] == 2 && board[2][1] == 2 && board[2][2] == 2) 
  {      
        textSize(50);
        ausgabe4(player);
        fill(colorBlack);
        text("drücken Sie ''a'',",450,50);
        text("um die Steuerung zu sehen", 450,150);
        ausgabe3();
        Ende = true;
        Ergebnis = true;
        return true; 
  }

  else if (board[0][2] == 1 && board[1][1] == 1 && board[2][0] == 1 || board[0][2] == 2 && board[1][1] == 2 && board[2][0] == 2) 
  {      
        textSize(50);
        ausgabe4(player);
        fill(colorBlack);
        text("drücken Sie ''a'',",450,50);
        text("um die Steuerung zu sehen", 450,150);
        ausgabe3();
        Ende = true;
        Ergebnis = true;
        return true; 
  }
 
  else if (board[0][0] == 1 && board[1][1] == 1 && board[2][2] == 1 || board[0][0] == 2 && board[1][1] == 2 && board[2][2] == 2) 
  {         
        textSize(50);
        ausgabe4(player);
        fill(colorBlack);
        text("drücken Sie ''a'',",450,50);
        text("um die Steuerung zu sehen", 450,150);
        ausgabe3();
        Ende = true;
        Ergebnis = true;
        return true; 
  }
  
  
  
     else if (board[1][0] == 1 && board[1][1] == 1 && board[1][2] == 1 || board[1][0] == 2 && board[1][1] == 2 && board[1][2] == 2) 
  {    
        textSize(50);
        ausgabe4(player);
        fill(colorBlack);
        text("drücken Sie ''a'',",450,50);
        text("um die Steuerung zu sehen", 450,150);
        ausgabe3();
        Ende = true;
        Ergebnis = true;
        return true; 
  }
  
    else if (board[2][0] == 1 && board[2][1] == 1 && board[2][2] == 1 || board[2][0] == 2 && board[2][1] == 2 && board[2][2] == 2) 
  {    
        textSize(50);
        ausgabe4(player);
        fill(colorBlack);
        text("drücken Sie ''a'',",450,50);
        text("um die Steuerung zu sehen", 450,150);
        ausgabe3();
        Ende = true;
        Ergebnis = true;
        return true; 
  }
  
    else if (board[0][0] == 1 && board[1][0] == 1 && board[2][0] == 1 || board[0][0] == 2 && board[1][0] == 2 && board[2][0] == 2) 
  {    
        textSize(50);
        ausgabe4(player);
        fill(colorBlack);
        text("drücken Sie ''a'',",450,50);
        text("um die Steuerung zu sehen", 450,150);
        ausgabe3();
        Ende = true;
        Ergebnis = true;
        return true; 
  }
  
    else if (board[0][1] == 1 && board[1][1] == 1 && board[2][1] == 1 || board[0][1] == 2 && board[1][1] == 2 && board[2][1] == 2) 
  {      
        textSize(50);
        ausgabe4(player);
        fill(colorBlack);
        text("drücken Sie ''a'',",450,50);
        text("um die Steuerung zu sehen", 450,150);
        ausgabe3();
        Ende = true;
        Ergebnis = true;
        return true; 
  }
  
     else if (board[0][2] == 1 && board[1][2] == 1 && board[2][2] == 1 || board[0][2] == 2 && board[1][2] == 2 && board[2][2] == 2) 
  {         
        textSize(50);
        ausgabe4(player);
        fill(colorBlack);
        text("drücken Sie ''a'',",450,50);
        text("um die Steuerung zu sehen", 450,150);
        ausgabe3();
        Ende = true;
        Ergebnis = true;
        return true; 
  }
  else
  {    
       Ende = false; 
       return false; 
  }
}

   
 void mouseClicked() 
{
  
  if (boardFilled(player))  
  {   
    hoch = false;  //Zum Erhöhen der Punktevariablen
    Ende = false;
    Ende2 = false;  // Zum Ende, wenn das Spiel unentschieden endet
    clearBoard();    
  }
  
  else
  { 
     playerMove();
  }
  
  if (Ende2 == true)
  {
   hoch = false;  //Zum Erhöhen der Punktevariablen
   Ende = false;
   Ende2 = false;  // Zum Ende, wenn das Spiel unentschieden endet
   clearBoard();
  } 
}
 
      
void keyPressed()
{
    if(key == ENTER)
    {
       hoch = false;   //Zum Erhöhen der Punktevariablen
       Ende = false;
       Ende2 = false;  // Zum Ende, wenn das Spiel unentschieden endet
       clearBoard(); 
    }    
}  
   
void ausgabe3()    // Die Punkteausgabe und die Punkteausgabe
{
 if (hilfeplayer == 1 && hoch == false)
 {
  Punkte1++; // Punkte1 wird erhöht
  hoch = true;
  return;
 }
 
 if (hilfeplayer == 2 && hoch == false)
 {
  Punkte2++;  //Punkte2 wird erhöht
  hoch = true;
  return;
 }
}
   
   
void ausgabe4(int player)
{
 
  if (player == 1)  
{            
    hilfeplayer = 2;            
    fill(colorB);
    textSize(50);
    text("Spieler",450,400);
    text(hilfeplayer,740,400);
    text("hat gewonnen",450,500);        
    fill(colorBlack);
    text("drücken Sie ''a'',",450,50);
    text("um die Steuerung zu sehen", 450,150);
    ausgabe3();
    Ende = true;
    Ergebnis = true; 
    return;
}
          
if (player == 2)
{
    hilfeplayer = 1;            
    fill(colorB);
    textSize(50);
    text("Spieler",450,400);
    text(hilfeplayer,740,400);
    text("hat gewonnen",450,500);        
    fill(colorBlack);
    text("drücken Sie ''a'',",450,50);
    text("um die Steuerung zu sehen", 450,150);
    ausgabe3();
    Ende = true;
    Ergebnis = true; 
    return;
  } 
}
   

boolean boardFilled() 
{
  for (int row = 0; row < 3; row++) 
  {
    if (!rowFilled(row))
   
      return n = false;
  }
  return n = true;
}
 



boolean rowFilled(int row) 
{
  for (int col = 0; col < 3; col++) 
  {
    if (board[row][col] == 0)
    {      
          return false;
    }
  }
  return true;  
}


void ausgabe()
{  
  size (900, 900);
  rectMode(CORNER);
  ellipseMode(CORNER);
  // Teile den Bildschirm in 3 by 3 cells
  cellWidth = width / 3;  //Breite
  cellHeight = height / 3;  //Höhe
  fill(colorBlack);
  clearBoard();      
  
  
  
  background(0);
  fill(240,255,255);
  textSize(15);
  text("Spielsteuerung TIC TAC TOE",400,50);
  text("------------------------------",400,70);
  text("Zum setzen eines ''X'' oder ''O'' die linke Maustaste drücken",400,100);
  text("Mit ''a'' ruft man das Steuerungsmenü auf",400,150);
  text("Mit ''k'' schließt man das Steuerungsmenü",400,200);
  text("Mit Enter löscht man die ''X''/''O'' auf dem Bildschirm",400,250);
  text("Spieler 1 ist --> ''X''",400,300);
  text("Spieler 2 ist --> ''O''",400,350);
  text("---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",1,500);
  text("Zum Spielen ''k'' drücken",400,600);
  text("---------------------",400,615);
  text("---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",1,700);
    
  fill(255);
  text("Aktueller Punktestand (O)",580,720);
  text("Aktueller Punktestand (X)",100,720);
  
  text(Punkte1,180,750);
  text(Punkte2,680,755);
  
  for (int i = 710; i < 2000; i++)
  {
   text("|",400,i); 
  }
  
  return; 
}

///////////////////////////

//QUELLENANGABEN:

// https://processing.org/examples/array.html -> Für 1-dimensionales Array
// https://processing.org/examples/array2d.html -> Für 2-dimensionales Array
// https://processing.org/examples/functions.html -> Für Funktionen mit / oder ohne Parameterübergabe
// http://www.farb-tabelle.de/de/farbtabelle.htm -> Für die Farbcodes
// https://processing.org/examples/input -> Für keyPressed und Key
// http://2.bp.blogspot.com/-Tw4fQBzCMgU/Ux4dCESwXmI/AAAAAAAAAeM/_I6bmSA-a5c/s1600/arrays+2+d.png -> 2 Dimensionales Array (Aufbau)
// https://processing.org/examples/widthheight.html -> Höhe und Breite (Width and Height)
// https://processing.org/reference/switch.html -> Switch Case-Anweisung
// https://processing.org/examples/mousefunctions.html -> Um Mouse Clicked Events auszulösen

//////////////////////////
