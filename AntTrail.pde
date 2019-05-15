int [][] grid; //<>// //<>//
int i;
String sequence = "";

void setup() {
  i=0;
  frameRate(5);

  grid = new int[][]{
    {2, 0, 1, 0, 1, 1,0}, 
    {0, 0, 0, 0, 1, 0,0}, 
    {1, 0, 1, 0, 0, 1,0}, 
    {0, 0, 0, 0, 1, 1,1}, 
    {1, 1, 0, 1, 0, 0,1}, 
    {0, 0, 0, 1, 1, 0,0},
  };

  sequence = "DWAW";

  size(600, 500);
}

int antX=0;
int antY=0;
int forwardX = 1;
int forwardY = 0;

void draw() {
  drawGrid();
  step();
  i += 1;
  if(i>=sequence.length()){
    i=0;
  }
}

void step(){
  int difference;

    
      //Adelante
      if(sequence.charAt(i)=='W'){
        grid[antY][antX] = 0;
  
        if (antX != forwardX) {
          difference = forwardX - antX;
  
          if (difference > 0) {
  
            if (forwardX > grid[0].length - 1)
              forwardX = 0;
  
            antX = forwardX;
            forwardX += 1;
          } else if (difference < 0) {
  
            if (forwardX < 0)
              forwardX = grid[0].length - 1;
  
            antX = forwardX;
            forwardX -= 1;
          }
        } else if (antY != forwardY) {
          difference = forwardY - antY;
  
          if (difference > 0) {
  
            if (forwardY > grid.length - 1)
              forwardY = 0;
  
            antY = forwardY;
            forwardY += 1;
          } else if (difference < 0) {
  
            if (forwardY < 0)
              forwardY = grid.length - 1;
  
            antY = forwardY;
            forwardY -= 1;
          }
        }
        grid[antY][antX] = 2;
      }
    //Voltear hacia la izquierda
   if(sequence.charAt(i)=='A'){
      if (antX != forwardX) {
        difference = forwardX - antX;

        if (difference > 0) {

          forwardX = antX;
          forwardY -= 1;
        } else if (difference < 0) {

          forwardX = antX;
          forwardY += 1;
        }
      } else if (antY != forwardY) {
        difference = forwardY - antY;

        if (difference > 0) {

          forwardY = antY;
          forwardX += 1;
        } else if (difference < 0) {

          forwardY = antY;
          forwardX -= 1;
        }
      }
   }
      
    //Voltear hacia la derecha
    if(sequence.charAt(i)=='D'){
      if (antX != forwardX) {
        difference = forwardX - antX;

        if (difference > 0) {

          forwardX = antX;
          forwardY += 1;
        } else if (difference < 0) {

          forwardX = antX;
          forwardY -= 1;
        }
      } else if (antY != forwardY) {
        difference = forwardY - antY;

        if (difference > 0) {

          forwardY = antY;
          forwardX -= 1;
        } else if (difference < 0) {

          forwardY = antY;
          forwardX += 1;
        }
      }
    }
}

//Dibuja y actualiza el sketch
void drawGrid() {
  int x=20;
  int y=20;
  int pasoX=(width-40)/grid[0].length;
  int pasoY=(height-40)/grid.length;
  int fX=20+forwardX*pasoX+pasoX/2;
  int fY=20+forwardY*pasoY+pasoY/2;
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      if (grid[i][j]==1) {
        fill(0);
        rect(x, y, pasoX, pasoY);
      } else if (grid[i][j]==2) {
        fill(255);
        rect(x, y, pasoX,pasoY); 
        fill(255, 0, 0);
        ellipse(x+(pasoX/2), y+(pasoY/2), pasoX*.9,pasoY*.9);

      } else if (grid[i][j]==0) {
        fill(255);
        rect(x, y, pasoX, pasoY);
        fill(255, 255, 0);
        ellipse(fX,fY, pasoX*0.4,pasoY*.4);
      } else{
        fill(255);
        rect(x, y, pasoX, pasoY);
        

      }

      x+=pasoX ;
    }

    x=20;
    y+=pasoY;
  }
}
