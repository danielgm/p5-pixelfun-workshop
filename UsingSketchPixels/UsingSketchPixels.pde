
void setup() {
  size(800, 600);
}

void draw() {
  background(0);
  
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = color(i % 255, 0, 0);
  }
  updatePixels();
}
