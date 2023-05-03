class Player {
  float posX, posY, size, playerSpeed, xMovement, yMovement;
  float backSize, alpha;
  PVector playerPosition, playerColour;;
  
  Player(PVector playerPosition, float size, float playerSpeed, PVector playerColour) {
    this.playerPosition = playerPosition;
    this.size = size;
    this.playerSpeed = playerSpeed;
    this.playerColour = playerColour;
    this.alpha = 100;
  }
  
  void createPlayer(PVector playerPosition) {
     pushMatrix();
     fill(playerColour.x, playerColour.y, playerColour.z);
     circle(playerPosition.x, playerPosition.y, width * 0.015);
     popMatrix();
     
     pushMatrix();
     fill(playerColour.x, playerColour.y, playerColour.z, alpha);
     circle(playerPosition.x, playerPosition.y, width * 0.03 * backSize);
     popMatrix();
  }
  
  void update() {
    float differenceHorizontal = mouseX - playerPosition.x;
    playerPosition.x += differenceHorizontal * playerSpeed;
    
    float differenceVertical = mouseY - playerPosition.y;
    playerPosition.y += differenceVertical * playerSpeed;
  }
}
