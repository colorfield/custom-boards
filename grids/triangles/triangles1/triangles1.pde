/**
 * Draws an equilateral triangle based on mouseX, mouseY
 * starting from the center
 */
float x1, y1, x2, y2, x3, y3;

void setup(){
  size(400,400);
  fill(200);
  x1 = width/2;
  y1 = height/2;
}

void draw(){
  background(100);
  x2 = mouseX;
  y2 = mouseY;
  x3 = x1 + (cos(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
  y3 = y1 + (sin(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
  triangle(x1,y1,x2,y2,x3,y3);
}
