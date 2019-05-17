int [][] grid; //<>//
Ant ant;
String sequence = "";
int i;

void setup() {
  size(600, 500);
  frameRate(7);
  background(209);

  grid = new int[][]{
    {2, 0, 1, 0, 1, 1, 0}, 
    {0, 0, 0, 0, 1, 0, 0}, 
    {1, 0, 1, 0, 0, 1, 0}, 
    {0, 0, 0, 0, 1, 1, 1}, 
    {1, 1, 0, 1, 0, 0, 1}, 
    {0, 0, 0, 1, 1, 0, 0}, 
  };
  
  ant = new Ant();
  sequence = "FRFL";
  i=0;
}

String conditionSeq;

void draw() {
  drawGrid();
  //condition();
  //step(sequence);
  
  ant.action(sequence.charAt(i));
  
  i++;
  if (i>=sequence.length()) {
    i=0;
  }
}

/*void condition(){
  
  int fwdXCopy = forwardX;
  int fwdYCopy = forwardY;
    
  if(sequence.charAt(i)=='Y'){
    
    if (antX != fwdXCopy){
      if(fwdXCopy >= grid[0].length){
        fwdXCopy = 0;
      } else if(fwdXCopy < 0){
        fwdXCopy = grid[0].length - 1;
      }
      
    
    }
    
    
    
    int j = i;
    while(sequence.charAt(j) != '.'){
      j++;
    }
    sequence.substring(i+1,j);
    i=j;
  }
}*/

//Dibuja y actualiza el sketch
void drawGrid() {
  background(209);
  int x=20;
  int y=20;
  int pasoX=(width-40)/grid[0].length;
  int pasoY=(height-40)/grid.length;
  int fX=20+ant.getfwdX()*pasoX+pasoX/2;
  int fY=20+ant.getfwdY()*pasoY+pasoY/2;
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      if (grid[i][j]==1) {
        fill(0);
        rect(x, y, pasoX, pasoY);
      } else if (grid[i][j]==2) {
        fill(255);
        rect(x, y, pasoX, pasoY); 
        fill(255, 0, 0);
        ellipse(x+(pasoX/2), y+(pasoY/2), pasoX*.9, pasoY*.9);
      } else if (grid[i][j]==0) {
        fill(255);
        rect(x, y, pasoX, pasoY);
        fill(255, 255, 0);
        ellipse(fX, fY, pasoX*0.4, pasoY*.4);
      } else {
        fill(255);
        rect(x, y, pasoX, pasoY);
      }

      x+=pasoX ;
    }

    x=20;
    y+=pasoY;
  }
}
