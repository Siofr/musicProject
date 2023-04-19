class Player {
  float posX, posY, size, playerSpeed, xMovement, yMovement;
  int playerColour;
  PVector playerPosition;
  
  Player(PVector playerPosition, float size, float playerSpeed, int playerColour) {
    this.playerPosition = playerPosition;
    this.size = size;
    this.playerSpeed = playerSpeed;
    this.playerColour = playerColour;
  }
  
  void createPlayer(PVector playerPosition) {
     stroke(0);
     fill(playerColour);
     circle(playerPosition.x, playerPosition.y, width * 0.015);
  }
  
  void update() {
    float differenceHorizontal = mouseX - playerPosition.x;
    playerPosition.x += differenceHorizontal * this.playerSpeed;
    
    float differenceVertical = mouseY - playerPosition.y;
    playerPosition.y += differenceVertical * this.playerSpeed;
  }
}
