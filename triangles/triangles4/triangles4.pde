/**
 * Draws a random grid of equilateral triangles and saves it as a PDF.
 * Based on Vormplus work.
 */
int BG_COLOR = 255;
int FG_COLOR = 0;
int LINE_WEIGHT = 1;
int DOT_WEIGHT = 2;
int WIDTH = 600;
int HEIGHT = 400;
float T_RADIUS = 20;

float x, y;
float prevX, prevY;
int[][] visited;

Boolean savePDF = false;

void setup()
{
    int columns = ceil(WIDTH/T_RADIUS);
    int rows = ceil(HEIGHT/T_RADIUS);
    visited = new int[columns][rows];
    
    size(600, 400);
    background(BG_COLOR);
    stroke(FG_COLOR);
    
    //x = width/2;
    //y = height/2;
    x = 0;
    y = 0;
    prevX = x;
    prevY = y;

    stroke(FG_COLOR);
    strokeWeight(LINE_WEIGHT);
    point(x, y);
}


/**
 * Returns an unvisited point on the grid.
 * @todo unvisited test
 */
float[] gridPoint(){
  float angle = (TWO_PI / 6) * floor(random(6));
  float px = cos(angle) * T_RADIUS;
  float py = sin(angle) * T_RADIUS;  
  float[] p = {px,py};
  return p;
}

void draw()
{
    float[] p = gridPoint();
    x += p[0];
    y += p[1];
    
    if (x < 0 || x > width) {
        x = prevX;
        y = prevY;
    }
    
    if (y < 0 || y > height) {
        x = prevX;
        y = prevY;
    }
    
    stroke(FG_COLOR);
    strokeWeight(LINE_WEIGHT);
    line(x, y, prevX, prevY);
    
    strokeWeight(DOT_WEIGHT);
    point(x, y);
    
    prevX = x;
    prevY = y;
    
    if (savePDF) {
        saveFrame("pdf/grid-#####.pdf");
        savePDF = false;
    }
    
}

void keyPressed()
{
    if (key == 's') {
        savePDF = true;
    }
}