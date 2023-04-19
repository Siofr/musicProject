class Player {
  float posX, posY, size, playerSpeed, xMovement, yMovement;
  PVector playerPosition, playerColour;;
  
  Player(PVector playerPosition, float size, float playerSpeed, PVector playerColour) {
    this.playerPosition = playerPosition;
    this.size = size;
    this.playerSpeed = playerSpeed;
    this.playerColour = playerColour;
  }
  
  void createPlayer(PVector playerPosition) {
     fill(playerColour.x, playerColour.y, playerColour.z);
     circle(playerPosition.x, playerPosition.y, width * 0.015);
  }
  
  void update() {
    float differenceHorizontal = mouseX - playerPosition.x;
    playerPosition.x += differenceHorizontal * playerSpeed;
    
    float differenceVertical = mouseY - playerPosition.y;
    playerPosition.y += differenceVertical * playerSpeed;
  }
}
