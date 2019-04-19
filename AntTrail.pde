void setup() {
  size(400, 400);

  int x=20;
  int y=20;

  int [][] grid= new int[][]{
    {0, 0, 1, 0, 1, 1}, 
    {0, 0, 0, 0, 1, 0}, 
    {1, 0, 1, 0, 0, 1}, 
    {0, 0, 0, 0, 1, 1}, 
    {1, 1, 0, 1, 0, 0}, 
    {0, 0, 0, 1, 1, 0}
  };

  for (int i=0; i<grid.length; i++)
  {
    for (int j=0; j<grid[i].length; j++)
    {
      if (grid[i][j]==1)
        fill(0);

      else
        fill(255);

      rect(x, y, 60, 60);
      x+=60;
    }
    x=20;   
    y+=60;
  }
}

void draw() {
}
