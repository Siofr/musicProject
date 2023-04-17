float x, y, z;
float cameraPosX, cameraPosY, cameraEyeZ, scrollSpeed;

void setup() {
  fullScreen(P3D);
  fill(204);
  x = width/2;
  y = height/2;
  
  scrollSpeed = 15;
  cameraEyeZ = 1;
  
  z = 0;
}

void draw() {
  lights();
  background(0);
  drawCubes();
  cameraMovement();
}

void drawCubes() {
  noStroke();
  pushMatrix();
  box(90);
  popMatrix();
}

void cameraMovement() {
  camera(mouseX, mouseY, cameraEyeZ, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
}

void mouseWheel(MouseEvent direction) {
  cameraEyeZ = cameraEyeZ + (direction.getCount() * scrollSpeed);
}
