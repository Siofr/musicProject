class Player {
  float posX, posY, size;
  int playerColour;
  PVector pos;
  
  Player(float posX, float posY, float size, int playerColour) {
    this.posX = posX;
    this.posY = posY;
    this.size = size;
    this.playerColour = playerColour;
  }
  
  void createPlayer(float x, float y) {
     stroke(0);
     fill(playerColour);
     circle(x, y, width * 0.015);
  }
  
  void crosshair(float x, float y) {
  
    // Target
    stroke(0);
    line(mouseX, mouseY - height * 0.005, mouseX, mouseY - height * 0.015);
    line(mouseX, mouseY + height * 0.005, mouseX, mouseY + height * 0.015);
    line(mouseX - width * 0.005, mouseY, mouseX - width * 0.015, mouseY);
    line(mouseX + width * 0.005, mouseY, mouseX + width * 0.015, mouseY);
  
    // Laser
    stroke(255, 0, 0);
    line(x, y, mouseX, mouseY);
  }
  
  void update() {
    if(keyPressed) {
      if (keyCode == LEFT) {
        x -= speed;
      } else if (keyCode == RIGHT) {
        x += speed;
      } else if (keyCode == DOWN) {
        y += speed;
      } else if (keyCode == UP) {
        y -= speed;
      }
    }
  }
}
