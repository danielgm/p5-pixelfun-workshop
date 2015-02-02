
int brushSize;
int brushStep;
int prevStepX;
int prevStepY;

void setup() {
  size(800, 600);
  background(0);
  
  brushSize = 40;
  brushStep = 15;
}

void draw() {
}

void mouseReleased() {
  drawBrush(mouseX, mouseY);
  stepped(mouseX, mouseY);
}

void mouseDragged() {
  if (stepCheck(mouseX, mouseY)) {
    drawBrush(mouseX, mouseY);
    stepped(mouseX, mouseY);
  }
}
void drawBrush(int x, int y) {
  circleFalloffBrush(x, y);
}

void squareBrush(int targetX, int targetY) {
  loadPixels();
  for (int x = targetX - brushSize; x <= targetX + brushSize; x++) {
    if (x < 0 || x >= width) continue;
    for (int y = targetY - brushSize; y <= targetY + brushSize; y++) {
      if (y < 0 || y >= height) continue;
      pixels[y * width + x] = lerpColor(pixels[y * width + x], color(255, 0, 0), 0.5);
    }
  }
  updatePixels();
}

void squareFalloffBrush(int targetX, int targetY) {
  loadPixels();
  for (int x = targetX - brushSize; x <= targetX + brushSize; x++) {
    if (x < 0 || x >= width) continue;
    for (int y = targetY - brushSize; y <= targetY + brushSize; y++) {
      if (y < 0 || y >= height) continue;
      float dx = x - targetX;
      float dy = y - targetY;
      float v = map(max(sqrt(dx * dx), sqrt(dy * dy)), 0, brushSize, 255, 0);
      color c = pixels[y * width + x];
      pixels[y * width + x] = color(constrain(red(c) + v, 0, 255), 0, 0);
    }
  }
  updatePixels();
}

void circleFalloffBrush(int targetX, int targetY) {
  loadPixels();
  for (int x = targetX - brushSize; x <= targetX + brushSize; x++) {
    if (x < 0 || x >= width) continue;
    for (int y = targetY - brushSize; y <= targetY + brushSize; y++) {
      if (y < 0 || y >= height) continue;
      float dx = x - targetX;
      float dy = y - targetY;
      float v = constrain(map(sqrt(dx * dx + dy * dy), 0, brushSize, 255, 0), 0, 255);
      color c = pixels[y * width + x];
      pixels[y * width + x] = color(constrain(red(c) + v, 0, 255), 0, 0);
    }
  }
  updatePixels();
}

void voronoiBrush(int targetX, int targetY) {
  loadPixels();
  for (int x = targetX - brushSize; x <= targetX + brushSize; x++) {
    if (x < 0 || x >= width) continue;
    for (int y = targetY - brushSize; y <= targetY + brushSize; y++) {
      if (y < 0 || y >= height) continue;
      float dx = x - targetX;
      float dy = y - targetY;
      float v = map(dx * dx + dy * dy, 0, brushSize * brushSize, 255, 0);
      color c = pixels[y * width + x];
      pixels[y * width + x] = color(max(red(c), v), 0, 0);
    }
  }
  updatePixels();
}

boolean stepCheck(int x, int y) {
  float dx = x - prevStepX;
  float dy = y - prevStepY;
  return brushStep * brushStep < dx * dx  +  dy * dy;
}

void stepped(int x, int y) {
  prevStepX = x;
  prevStepY = y;
}



