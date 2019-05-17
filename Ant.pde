public class Ant {

  private int x;
  private int y;
  private int fwdX;
  private int fwdY;

  public Ant() {
    this.x = 0;
    this.y = 0;
    this.fwdX = x+1;
    this.fwdY = y;
  }

  public void action(char movement) {
    switch(movement) {
    case 'F':
      this.forward();
      print("Forward, ");
      break;

    case 'L':
      this.lookLeft();
      print("Left, ");
      break;

    case 'R':
      this.lookRight();
      print("Right, ");
      break;
    }
  }

  private void forward() {
    int difference;
    grid[y][x] = 0;

    if (x != fwdX) {
      difference = fwdX - x;

      if (difference > 0) {

        if (fwdX > grid[0].length - 1)
          fwdX = 0;

        x = fwdX;
        fwdX += 1;
      } else if (difference < 0) {

        if (fwdX < 0)
          fwdX = grid[0].length - 1;

        x = fwdX;
        fwdX -= 1;
      }
    } else if (y != fwdY) {
      difference = fwdY - y;

      if (difference > 0) {

        if (fwdY > grid.length - 1)
          fwdY = 0;

        y = fwdY;
        fwdY += 1;
      } else if (difference < 0) {

        if (fwdY < 0)
          fwdY = grid.length - 1;

        y = fwdY;
        fwdY -= 1;
      }
    }
    grid[y][x] = 2;
  }

  private void lookLeft() {
    int difference;
    if (x != fwdX) {
      difference = fwdX - x;

      if (difference > 0) {

        fwdX = x;
        fwdY -= 1;
      } else if (difference < 0) {

        fwdX = x;
        fwdY += 1;
      }
    } else if (y != fwdY) {
      difference = fwdY - y;

      if (difference > 0) {

        fwdY = y;
        fwdX += 1;
      } else if (difference < 0) {

        fwdY = y;
        fwdX -= 1;
      }
    }
  }

  private void lookRight() {
    int difference;
    if (x != fwdX) {
      difference = fwdX - x;

      if (difference > 0) {

        fwdX = x;
        fwdY += 1;
      } else if (difference < 0) {

        fwdX = x;
        fwdY -= 1;
      }
    } else if (y != fwdY) {
      difference = fwdY - y;

      if (difference > 0) {

        fwdY = y;
        fwdX -= 1;
      } else if (difference < 0) {

        fwdY = y;
        fwdX += 1;
      }
    }
  }

  public int getX() {
    return this.x;
  }
  public int getY() {
    return this.y;
  }
  public int getfwdX() {
    return this.fwdX;
  }
  public int getfwdY() {
    return this.fwdY;
  }
}
