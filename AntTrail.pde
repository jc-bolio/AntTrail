import java.util.*; //<>// //<>// //<>// //<>//

int [][] grid;
Ant ant;
String sequence = "";
int i;
int j;
StringTokenizer st;
ArrayList<String> instructions = new ArrayList();
boolean food = false;

void setup() {
  size(600, 500);
  frameRate(5);
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
  sequence = "FY.FR.N.FL.";
  i=0;
  j=0;

  divideSequence(sequence);
  drawGrid();
}

void draw() {
  sequence = instructions.get(j);

  while (sequence.charAt(i) == 'Y') {
    food = checkForFood();
    if (!food) {
      j++;
      if (j >= instructions.size()) {
        j=0;
      }
      sequence = instructions.get(j);
    } else
      i++;
  }

  while (sequence.charAt(i) == 'N') {
    if (food) {
      j++;
      if (j >= instructions.size()) {
        j=0;
      }
      sequence = instructions.get(j);
    } else
      i++;
  }

  sequence = instructions.get(j);
  print(sequence + ": ");
  ant.action(sequence.charAt(i));

  i++;

  sequence = instructions.get(j);

  if (i>=sequence.length()) {
    i=0;
    j++;
  }

  if (j >= instructions.size()) {
    j=0;
  }
  drawGrid();
}

boolean checkForFood() {

  int fwdXCopy = ant.getfwdX();
  int fwdYCopy = ant.getfwdY(); 

  if (ant.getX() != fwdXCopy) {
    if (fwdXCopy >= grid[0].length) {
      fwdXCopy = 0;
    } else if (fwdXCopy < 0) {
      fwdXCopy = grid[0].length - 1;
    }
  } else if (ant.getY() != fwdYCopy) {
    if (fwdYCopy >= grid.length) {
      fwdYCopy = 0;
    } else if (fwdYCopy < 0) {
      fwdYCopy = grid.length - 1;
    }
  }

  return grid[fwdYCopy][fwdXCopy] == 1;
}

void divideSequence(String sequence) {
  st = new StringTokenizer(sequence, "Y.N", true);

  while (st.hasMoreTokens()) {
    String temp = st.nextToken();

    if (!temp.equals(".")) {

      if (temp.equals("Y")) {
        st.nextToken();
        instructions.add(temp + st.nextToken());
      } else if (temp.equals("N")) {
        st.nextToken();
        instructions.add(temp + st.nextToken());
      } else {
        instructions.add(temp);
      }
    }
  }
  println(instructions.toString());
}

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
