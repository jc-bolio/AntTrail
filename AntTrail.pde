int [][] grid; //<>//
String sequence = "";

void setup() {
  frameRate(6);

  grid = new int[][]{
    {2, 0, 1, 0, 1, 1}, 
    {0, 0, 0, 0, 1, 0}, 
    {1, 0, 1, 0, 0, 1}, 
    {0, 0, 0, 0, 1, 1}, 
    {1, 1, 0, 1, 0, 0}, 
    {0, 0, 0, 1, 1, 0}
  };

  sequence = "WDWWA";

  size(400, 400);
  drawGrid(grid);
}

int antX=0;
int antY=0;
int forwardX = 1;
int forwardY = 0;

void draw() {

  for (int i = 0; i < sequence.length(); i++) {

    int difference;

    switch (sequence.charAt(i)) {
      
    //Adelante
    case 'W':

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
      drawGrid(grid);
      break;
      
    //Voltear hacia la izquierda
    case 'A': //<>//
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
      break;
      
    //Voltear hacia la derecha
    case 'D':
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
      break;
      
    //Condición: Si hay comida adelante
    case 'Y':
    
    //Condición: Si no hay comida adelante
    case 'N':
    }
  }
}

//Dibuja y actualiza el sketch
void drawGrid(int[][] grid) {
  int x=20;
  int y=20;

  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      if (grid[i][j]==1) {
        fill(0);
        rect(x, y, 60, 60);
      } else if (grid[i][j]==2) {
        fill(255);
        rect(x, y, 60, 60);
        fill(255, 0, 0);
        circle(50+(antX*60), 50+(antY*60), 40);
      } else {
        fill(255);
        rect(x, y, 60, 60);
      }

      x+=60;
    }

    x=20;
    y+=60;
  }
}
