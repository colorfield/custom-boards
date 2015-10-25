/**
 * Draws a random grid of equilateral triangles.
 * Variation of triangle2
 */
void setup(){
  int MIN_SIZE = 5;
  float T_SIZE = 30;
  float x1, y1, x2, y2, x3, y3;
  size(400,400);
  background(200);
  noStroke();
  for (x1 = 0; x1 < width; x1 += T_SIZE) {
    fill(random(150));
    for(y1 = T_SIZE; y1 < height; y1 += T_SIZE) {
      x2 = x1 + random(T_SIZE) + MIN_SIZE;
      y2 = y1 + random(T_SIZE) + MIN_SIZE;
      x3 = x1 + (cos(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
      y3 = y1 + (sin(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
      triangle(x1,y1,x2,y2,x3,y3);  
    }
  }
}