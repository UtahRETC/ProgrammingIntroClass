/*
Hi friends! Your assignment is to make the code match the pattern in the picture.
*/

final color WHITE = color(255, 255, 255);
final color BLACK = color(0, 0, 0);

final color ORANGE = color(232, 99, 34);
final color YELLOW = color(253, 218, 2);
final color GREEN = color(1, 156, 78);
final color BLUE = color(0, 148, 208);
final color VIOLET = color(129, 97, 172);

final int TILE_SIZE = 70;
final int TILE_PADDING = 2;

void setup() {
  size(1000, 750);
  rectMode(RADIUS);
  textAlign(CENTER, CENTER);
  textSize(20);
  noStroke();
  noLoop();
}

void draw() {
  background(WHITE);

  circleTile(0, 3, VIOLET);
  cloverTile(1, 3, VIOLET);
  starTile(2, 3, VIOLET);
  xTile(3, 3, VIOLET);

  xTile(3, 0, VIOLET);
  xTile(3, 1, GREEN);
  xTile(3, 2, YELLOW);
  xTile(3, 4, ORANGE);
  xTile(2, 5, BLUE);

  cloverTile(1, 1, GREEN);
  starTile(4, 1, GREEN);

  circleTile(5, 0, YELLOW);
  circleTile(5, 1, GREEN);
  circleTile(5, 2, BLUE);

  cloverTile(6, 0, YELLOW);
  xTile(7, 0, YELLOW);
  squareTile(8, 0, YELLOW);

  xTile(7, 1, GREEN);
  xTile(7, 2, BLUE);

  starTile(10, 0, YELLOW);
  starTile(9, 1, BLUE);
  starTile(9, 2, GREEN);

  xTile(7, 3, VIOLET);
  diamondTile(8, 3, VIOLET);
  starTile(9, 3, VIOLET);
  squareTile(10, 3, VIOLET);
  cloverTile(11, 3, VIOLET);
  circleTile(12, 3, VIOLET);

  cloverTile(11, 1, VIOLET);
  cloverTile(11, 2, ORANGE);
  cloverTile(11, 4, YELLOW);
  cloverTile(11, 5, GREEN);
  cloverTile(11, 7, BLUE);

  starTile(12, 1, VIOLET);
  circleTile(13, 1, VIOLET);

  squareTile(4, 4, ORANGE);
  starTile(5, 4, ORANGE);

  starTile(5, 5, BLUE);
  starTile(5, 6, GREEN);
  starTile(4, 7, YELLOW);
  starTile(4, 8, VIOLET);
  starTile(4, 9, VIOLET);

  cloverTile(6, 5, ORANGE);
  circleTile(7, 5, ORANGE);
  diamondTile(8, 5, BLUE);
  xTile(9, 5, YELLOW);

  diamondTile(8, 4, GREEN);
  diamondTile(8, 6, ORANGE);
  diamondTile(8, 8, YELLOW);
  xTile(9, 8, YELLOW);
}

// Helpers

void tileBackground(int x, int y) {
  fill(BLACK);
  float cx = (x + 0.5) * TILE_SIZE;
  float cy = (y + 0.5) * TILE_SIZE;
  int w = (TILE_SIZE - TILE_PADDING) / 2;
  rect(cx, cy, w, w);
}

void circleTile(int x, int y, color tileColor) {
  tileBackground(x, y);
  fill(tileColor);
  float cx = (x + 0.5) * TILE_SIZE;
  float cy = (y + 0.5) * TILE_SIZE;
  float radius = TILE_SIZE * 0.8;
  ellipse(cx, cy, radius, radius);
}

void squareTile(int x, int y, color tileColor) {
  tileBackground(x, y);
  fill(tileColor);

  // TODO: put your code for square tiles here!
  // Look at the circleTile function for a hint
}

void diamondTile(int x, int y, color tileColor) {
  tileBackground(x, y);
  fill(tileColor);
  float cx = (x + 0.5) * TILE_SIZE;
  float cy = (y + 0.5) * TILE_SIZE;
  float radius = 0.4 * TILE_SIZE;
  beginShape();
  vertex(cx, cy - radius); // top point
  vertex(cx + radius, cy); // right point
  vertex(cx, cy + radius); // bottom point
  vertex(cx - radius, cy); // left point
  endShape();
}

void xTile(int x, int y, color tileColor) {
  tileBackground(x, y);
  fill(tileColor);
  float cx = (x + 0.5) * TILE_SIZE;
  float cy = (y + 0.5) * TILE_SIZE;
  float closeRadius = 0.2 * TILE_SIZE;
  float farRadius = 0.4 * TILE_SIZE;
  beginShape();
  vertex(cx, cy - closeRadius); // Top
  vertex(cx + farRadius, cy - farRadius);
  vertex(cx + closeRadius, cy); // Right
  vertex(cx + farRadius, cy + farRadius);
  vertex(cx, cy + closeRadius); // Bottom
  vertex(cx - farRadius, cy + farRadius);
  vertex(cx - closeRadius, cy); // Left
  vertex(cx - farRadius, cy - farRadius);
  endShape();
}

void starTile(int x, int y, color tileColor) {
  tileBackground(x, y);
  fill(tileColor);
  float cx = (x + 0.5) * TILE_SIZE;
  float cy = (y + 0.5) * TILE_SIZE;
  float closeRadius = 0.2 * TILE_SIZE;
  float farRadius = 0.45 * TILE_SIZE;
  beginShape();
  for (int i = 0; i < 8; i++) {
    float farAngle = 2 * PI * (i / 8.0);
    float farX = cx + (cos(farAngle) * farRadius);
    float farY = cy + (sin(farAngle) * farRadius);
    vertex(farX, farY);

    float closeAngle = 2 * PI * ((i / 8.0) + (1.0 / 16.0));
    float closeX = cx + (cos(closeAngle) * closeRadius);
    float closeY = cy + (sin(closeAngle) * closeRadius);
    vertex(closeX, closeY);
  }
  endShape();
}

void cloverTile(int x, int y, color tileColor) {
  tileBackground(x, y);
  fill(tileColor);

  float cornerPercent = 0.4;
  float controlPercent = 0.02;

  // Top left
  float topLeftX = (x + cornerPercent) * TILE_SIZE;
  float topLeftY = (y + cornerPercent) * TILE_SIZE;
  float topLeftControlX = (x + controlPercent) * TILE_SIZE;
  float topLeftControlY = (y + controlPercent) * TILE_SIZE;

  // Top right
  float topRightX = (x + 1 - cornerPercent) * TILE_SIZE;
  float topRightY = (y + cornerPercent) * TILE_SIZE;
  float topRightControlX = (x + 1 - controlPercent) * TILE_SIZE;
  float topRightControlY = (y + controlPercent) * TILE_SIZE;

  // Bottom right
  float bottomRightX = (x + 1 - cornerPercent) * TILE_SIZE;
  float bottomRightY = (y + 1 - cornerPercent) * TILE_SIZE;
  float bottomRightControlX = (x + 1 - controlPercent) * TILE_SIZE;
  float bottomRightControlY = (y + 1 - controlPercent) * TILE_SIZE;

  // Bottom left
  float bottomLeftX = (x + cornerPercent) * TILE_SIZE;
  float bottomLeftY = (y + 1 - cornerPercent) * TILE_SIZE;
  float bottomLeftControlX = (x + controlPercent) * TILE_SIZE;
  float bottomLeftControlY = (y + 1 - controlPercent) * TILE_SIZE;

  beginShape();
  vertex(topLeftX, topLeftY);
  bezierVertex(topLeftControlX, topLeftControlY, topRightControlX, topRightControlY, topRightX, topRightY);
  bezierVertex(topRightControlX, topRightControlY, bottomRightControlX, bottomRightControlY, bottomRightX, bottomRightY);
  bezierVertex(bottomRightControlX, bottomRightControlY, bottomLeftControlX, bottomLeftControlY, bottomLeftX, bottomLeftY);
  bezierVertex(bottomLeftControlX, bottomLeftControlY, topLeftControlX, topLeftControlY, topLeftX, topLeftY);
  endShape();
}
