class Enemy {
  float posX, posY, size;
  int enemyColour;
  
  Enemy(float posX, float posY, float size, int enemyColour) {
    this.posX = posX;
    this.posY = posY;
    this.size = size;
    this.enemyColour = enemyColour;
  }
  
  void createEnemy(float x, float y) {
     stroke(0);
     fill(enemyColour);
     circle(x, y, width * 0.015);
  }
}
