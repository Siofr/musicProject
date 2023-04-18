class Pickup {
  float posX, posY, size;
  PVector currentPos;
  int pickupColour;
  
  Pickup(float posX, float posY, float size, int pickupColour) {
    this.posX = posX;
    this.posY = posY;
    this.currentPos = new PVector(posX, posY);
    this.size = size;
    this.pickupColour = pickupColour;
  }
  
  void createPickup() {
     stroke(0);
     fill(pickupColour);
     circle(this.posX, this.posY, width * 0.015);
  }
  
  boolean pickedUp(PVector playerPos, float playerSize) {
    if (dist(playerPos.x, playerPos.y, currentPos.x, currentPos.y) < playerSize) {
      return true;
    } else {
      return false;
    }
  }
}
