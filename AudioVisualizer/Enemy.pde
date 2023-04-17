class Enemy {
  float posX, posY, enemySpeed, size;
  PVector playerDiff, currentPos;
  int enemyColour;
  
  Enemy(float posX, float posY, float size, float enemySpeed, int enemyColour) {
    this.posX = posX;
    this.posY = posY;
    this.currentPos = new PVector(posX, posY);
    this.size = size;
    this.enemySpeed = enemySpeed;
    this.enemyColour = enemyColour;
  }
  
  void createEnemy() {
     stroke(0);
     fill(enemyColour);
     circle(this.posX, this.posY, width * 0.015);
  }
}
