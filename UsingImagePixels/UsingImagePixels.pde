
PImage img;

void setup() {
  size(800, 600);
  img = createImage(width, height, RGB);
}

void draw() {
  background(0);
  
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    img.pixels[i] = color(i % 255, 0, 0);
  }
  img.updatePixels();
  
  image(img, 0, 0);
}
