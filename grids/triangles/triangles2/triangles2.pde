/**
 * Draws a grid of equilateral triangles
 */
void setup(){
  float x1, y1, x2, y2, x3, y3;
  size(400,400);
  fill(200);
  float tSize = 50;
  for (x1 = 0; x1 < width; x1 += tSize) {
    /*
    y1 = tSize;
    x2 = tSize;
    y2 = tSize;
    */
    for(y1 = tSize; y1 < height; y1 += tSize) {
      x2 = x1 + tSize;
      y2 = y1 + tSize;
      x3 = x1 + (cos(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
      y3 = y1 + (sin(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
      triangle(x1,y1,x2,y2,x3,y3);  
    }
  }
}