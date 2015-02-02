
void setup() {
  size(800, 600);
}

void draw() {
  background(0);
  
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int i = y * width + x;
      pixels[i] = color(x % 255, 255 - x % 255, y % 255);
    }
  }
  updatePixels();
}
