/**
 * Draws equilateral triangles randomly, based on the mouse interaction.
 */
float x1, y1, x2, y2, x3, y3;
 
void setup() {
  smooth();
  size(600, 400);
  background(0);
}
 
void draw() {
  setupTriangles();
 
  if (mousePressed==true)
  {
    drawTriangles();
  }
}

void keyPressed() {
  if (keyCode == ENTER)
  {
    background(0);
  }
}

void setupTriangles() {
  x1 = random(mouseX-random(100), mouseX+random(100));
  y1 = random(mouseY-random(100), mouseY+random(100));
  x2 = random(mouseX-random(100), mouseX+random(100));
  y2 = random(mouseY-random(100), mouseY+random(100));
  x3 = x1 + (cos(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
  y3 = y1 + (sin(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
}
 
void drawTriangles() {
  strokeWeight(0.1);
  fill(0, random(256), random(256));
  triangle(x1, y1, x2, y2, x3, y3);
}